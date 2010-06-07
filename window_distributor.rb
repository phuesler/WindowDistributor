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
    @screen = NSScreen.mainScreen.frame
    @system_events = SBApplication.applicationWithBundleIdentifier("com.apple.SystemEvents")
  end
  
  def run
    process = @system_events.applicationProcesses.find {|a| a.frontmost }
    windows = process.windows.select{|w| w.properties["subrole"] == "AXStandardWindow"}
    @calculator = DistributionCalculator.new(number_of_windows: windows.size,
                                             max_height: @screen.size.height,
                                             max_width: @screen.szie.width)
    index = 0
    windows.each do |target|
      positionWindow(target,index)
      index = index + 1
    end
  end
  
  def positionWindow(target, index)
    origin = target.propertyWithCode(POSITION_CODE)
    size   = target.propertyWithCode(SIZE_CODE)
    origin.setTo(@calculator.position(index))
    size.setTo(@calculator.size)
  end
end