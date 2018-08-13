require 'test_helper'

class SurveysControllerTest < ActionController::TestCase
  test "should get dasboard" do
    get :dasboard
    assert_response :success
  end

  test "should get results" do
    get :results
    assert_response :success
  end

end
