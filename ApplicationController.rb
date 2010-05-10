# ApplicationController.rb
# WindowDistributor
#
# Created by phuesler on 10.05.10.
# Copyright 2010 huesler informatik. All rights reserved.
class ApplicationController
  attr_accessor :duuuuuuuuuuuh
  
  def applicationDidFinishLaunching(notification)
    NSLog("we are launched")
    @distributor = WindowDistributor.new
  end
  
  def distributeWindows(sender)
    NSLog("will distribute windows")
    @distributor.run
  end
end

