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
        member_id:  @period.member_id,
        process_id: @period.process_id,
        project_id: @period.project_id,
        start_at:   @period.start_at
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
