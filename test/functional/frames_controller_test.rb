require 'test_helper'

class FramesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frame" do
    assert_difference('Frame.count') do
      post :create, :frame => { }
    end

    assert_redirected_to frame_path(assigns(:frame))
  end

  test "should show frame" do
    get :show, :id => frames(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => frames(:one).to_param
    assert_response :success
  end

  test "should update frame" do
    put :update, :id => frames(:one).to_param, :frame => { }
    assert_redirected_to frame_path(assigns(:frame))
  end

  test "should destroy frame" do
    assert_difference('Frame.count', -1) do
      delete :destroy, :id => frames(:one).to_param
    end

    assert_redirected_to frames_path
  end
end
