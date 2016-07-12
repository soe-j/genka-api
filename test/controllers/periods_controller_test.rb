require 'test_helper'

class PeriodsControllerTest < ActionController::TestCase
  setup do
    @period = periods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:periods)
  end

  test "should create period" do
    assert_difference('Period.count') do
      post :create, period: {
        project_id: projects(:one).id,
        stage_id:   stages(:one).id,
        member_id:  members(:one).id,
        start_at:   DateTime.now
      }
    end
    assert_response :created
  end

  test "should show period" do
    get :show, id: @period
    assert_response :success
  end

  test "should destroy period" do
    assert_difference('Period.count', -1) do
      delete :destroy, id: @period
    end
    assert_response :no_content
  end
end
