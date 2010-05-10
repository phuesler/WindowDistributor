# DistributionCalculator.rb
# WindowDistributor
#
# Created by phuesler on 10.05.10.
# Copyright 2010 huesler informatik. All rights reserved.
class DistributionCalculator
  def initialize(options = {number_of_windows: 2, max_height: 600, max_width: 800})
    @number_of_windows = options.delete(:number_of_windows)
    @max_height = options.delete(:max_height)
    @max_width = options.delete(:max_width)
  end
  
  def x(index)
    width * index
  end
  
  def y
    0
  end
  
  def position(index)
    [x(index),y]
  end
  
  def size
    [width,height]
  end
  
  def width
    @max_width / @number_of_windows
  end
  
  def height
    @max_height
  end  
end