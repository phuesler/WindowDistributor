# WindowDistributor.rb
# WindowDistributor
#
# Created by phuesler on 10.05.10.
# Copyright 2010 huesler informatik. All rights reserved.
class WindowDistributor
  SIZE_CODE = 'ptsz'.unpack('N').first
  POSITION_CODE = 'posn'.unpack('N').first
  ACTIONS_CODE = 'actT'.unpack('N').first
  
  def initialize
    NSLog("go")
    @screen = NSScreen.mainScreen.frame
    @screen_height = @screen.size.height
    @screen_width = @screen.size.width
    @system_events = SBApplication.applicationWithBundleIdentifier("com.apple.SystemEvents")
  end
  
  def run
    # process = @system_events.applicationProcesses.find {|p| p.frontmost}
    process = @system_events.applicationProcesses.find {|a| a.name.downcase == 'finder'}
    number_of_windows = process.windows.size
    counter = 1
    process.windows.each do |target|
      origin = target.propertyWithCode(POSITION_CODE)
      size   = target.propertyWithCode(SIZE_CODE)
      x = counter *  (@screen_width / 2) - (@screen_width / 2)
      origin.setTo([x ,0])
      size.setTo([@screen_width / 2,@screen_height])
      counter = counter + 1
    end
  end
end


