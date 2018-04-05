require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest

  test "should show report for member" do
    @project = projects(:one)
    @stage = stages(:one)
    @member = members(:one)
    @period  = Period.create(project_id: @project.id, stage_id: @stage.id, member_id: @member.id)
    @other_member_period = Period.create(project_id: 1, stage_id: 1, member_id: 999)
    @before_period = Period.create(project_id: @project_id, stage_id: @stage.id, member_id: @member.id, start_at: '200001010000')

    get member_reports_url(member_id: @member), as: :json
    assert_response :success
    assert_not_empty assigns(:periods)
    assert_empty assigns(:periods).select{|period| period.member_id != @member.id }
  end
end
