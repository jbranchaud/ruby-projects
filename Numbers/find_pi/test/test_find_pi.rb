require 'test/unit'
require 'find_pi'

class FindPiTest < Test::Unit::TestCase

  def test_find_pi_basic
    # find pi to two decimal places
    assert_equal "3.14", FindPi.find(2)
    # find pi to one decimal place
    assert_equal "3.1", FindPi.find(1)
    # find pi to zero decimal places
    assert_equal "3", FindPi.find(0)
    # find pi to 17 decimal places
    assert_equal "3.14159265358979323", FindPi.find(17)
  end

  def test_find_pi_edge_cases
    # given a negative value, no thanks
    assert_equal "error", FindPi.find(-1)
    assert_equal "error", FindPi.find(-12)
    # given too large a value, no thanks
    assert_equal "error", FindPi.find(100)
  end

end
