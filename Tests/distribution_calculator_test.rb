require 'test/unit'

require 'distribution_calculator'

class DistributionCalculatorTest < Test::Unit::TestCase
  def setup
    @calculator = DistributionCalculator.new(number_of_windows: 2, max_height: 600, max_width:  800)
  end
  
  def test_height
    assert_equal(600,@calculator.height)
  end
  
  def test_width
    assert_equal(400,@calculator.width)
  end
  
  def test_x_for_first_element
    assert_equal(0,@calculator.x(0))
  end
  
  def test_x_for_second_element
    assert_equal(400,@calculator.x(1))
  end
  
  def test_y
    assert_equal(0,@calculator.y)
  end
  
  def test_position_for_first_element
    assert_equal([0,0],@calculator.position(0))
  end
  
  def test_position_for_second_element
    assert_equal([400,0],@calculator.position(1))
  end
  
  def test_size
    assert_equal([400,600], @calculator.size)
  end
end