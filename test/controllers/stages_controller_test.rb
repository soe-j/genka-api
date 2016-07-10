require 'test_helper'

class StagesControllerTest < ActionController::TestCase
  setup do
    @stage = stages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stages)
  end

  test "should create stage" do
    assert_difference('Stage.count') do
      post :create, stage: { name: "abc" }
    end
    assert_response :created
  end

  test "should show stage" do
    get :show, id: @stage
    assert_response :success
  end

  test "should destroy stage" do
    assert_difference('Stage.count', -1) do
      delete :destroy, id: @stage
    end
    assert_response :no_content
  end
end
