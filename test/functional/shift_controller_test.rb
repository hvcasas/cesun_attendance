require 'test_helper'

class ShiftControllerTest < ActionController::TestCase
  test "should get shift" do
    get :shift
    assert_response :success
  end

end
