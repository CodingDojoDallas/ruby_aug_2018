require 'test_helper'

class SayControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get hello" do
    get :hello
    assert_response :success
  end

  test "should get helloJoe" do
    get :helloJoe
    assert_response :success
  end

  test "should get times" do
    get :times
    assert_response :success
  end

  test "should get reset" do
    get :reset
    assert_response :success
  end

end
