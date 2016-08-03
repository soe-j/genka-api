require 'test_helper'

class PeriodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @period = periods(:one)
  end

  test "should get index" do
    get periods_url, as: :json
    assert_response :success
  end

  test "should get index member periods" do
    @period = Period.create(project_id: 1, stage_id: 1, member_id: 1)
    @other_member_period = Period.create(project_id: 1, stage_id: 1, member_id: 2)
    get periods_url, params: {
      member_id: @period.member_id
    }, as: :json
    assert_response :success
    assert_not_empty assigns(:periods)
    assert_empty assigns(:periods).select{|period| period.member_id != @period.member_id }
  end

  test "should create period" do
    assert_difference('Period.count') do
      post periods_url, params: { period: {
        project_id: projects(:one).id,
        stage_id:   stages(:one).id,
        member_id:  members(:one).id,
        start_at:   DateTime.now
      } }, as: :json
    end

    assert_response 201
  end

  test "should show period" do
    get period_url(@period), as: :json
    assert_response :success
  end

  test "should update period" do
    patch period_url(@period), params: { period: {
      project_id: projects(:one).id,
      stage_id:   stages(:one).id,
      member_id:  members(:one).id,
      start_at:   DateTime.now
    } }, as: :json
    assert_response 200
  end

  test "should destroy period" do
    assert_difference('Period.count', -1) do
      delete period_url(@period), as: :json
    end

    assert_response 204
  end
end
