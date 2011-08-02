require 'test_helper'

class ShiftTest < ActiveSupport::TestCase
  def setup
    @shift = Factory.create :shift, :description => 'new_one'
  end

  test 'must_have_description' do
    assert shift = Factory.build( :shift, :description => nil)
    assert shift.invalid?
  end

  test 'must_be_unique' do
    assert shift = Factory.build( :shift, :description => 'new_one' )
    assert shift.invalid?
  end

  test "must_be_minimum_5_chars" do
    assert shift = Factory.build( :shift, :description => '1234' )
    assert shift.invalid?
  end

  test "must_be_maximum_25_chars" do
    assert shift = Factory.build( :shift, :description => '12345678901234567890123456' )
    assert shift.invalid?
  end

  test 'create_shift' do
      assert shift = Factory.build(:shift, :description => 'new_two' )
      assert_difference 'Shift.count' do
        shift.save
      end
  end

  test "update_shift" do
    assert @shift.update_attributes :description => 'new_one_updated'
  end

  test "delete_shift" do
    assert_difference 'Shift.count', -1 do
      @shift.delete
    end
  end
end