# ApplicationController.rb
# WindowDistributor
#
# Created by phuesler on 10.05.10.
# Copyright 2010 huesler informatik. All rights reserved.
class ApplicationController
  attr_accessor :statusBarMenu
  
  def applicationDidFinishLaunching(notification)
    activateStatusMenu
    @distributor = WindowDistributor.new
  end
  
  def distributeWindows(sender)
    @distributor.run
  end
  
  def activateStatusMenu
    statusBarItem = NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength)
    statusBarItem.setToolTip("RedistributeWindows")
    statusBarItem.title = "Distribute"
    statusBarItem.setHighlightMode(true)
    statusBarItem.setEnabled(true)
    
    # statusImage = NSImage.alloc.initWithContentsOfFile(
    #                               NSBundle.mainBundle.pathForResource("network", ofType: "png")
    #                               )
    # statusBarItem.setImage(statusImage)
    # statusBarItem.setAlternateImage(statusImage)
    statusBarItem.setMenu(statusBarMenu)
  end
end

