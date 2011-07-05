require 'test_helper'

class ShiftTest < ActiveSupport::TestCase

  test "should have descripcion" do
    shift = Shift.new
    assert shift.invalid?
  end
  
  test "should create shift" do
    assert_difference('Shift.count') do
      Factory.create :shift=
    end
  end
  
  

end
