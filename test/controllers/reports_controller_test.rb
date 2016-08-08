require 'test_helper'

class ReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
    @stage   = stages(:one)
    @member  = members(:one)
    @period  = Period.create(project_id: @project.id, stage_id: @stage.id, member_id: @member.id)
  end

  test "should show report for member" do
    get member_reports_url(member_id: @member), as: :json
    assert_response :success
  end
end
