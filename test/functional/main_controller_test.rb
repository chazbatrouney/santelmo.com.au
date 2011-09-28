require 'test_helper'

class MainControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get menu" do
    get :menu
    assert_response :success
  end

  test "should get drinks" do
    get :drinks
    assert_response :success
  end

  test "should get reservations" do
    get :reservations
    assert_response :success
  end

  test "should get gallery" do
    get :gallery
    assert_response :success
  end

  test "should get press" do
    get :press
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
