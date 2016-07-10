require 'test_helper'

class PeriodTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
    @stage   = stages(:one)
    @member  = members(:one)
    @period = Period.new(
      project: @project,
      stage:   @stage,
      member:  @member
    )
  end

  test "should not save period without project" do
    assert_not Period.new(stage: @stage, member: @member).save
  end

  test "should not save period without stage" do
    assert_not Period.new(project: @project, member: @member).save
  end

  test "should not save period without member" do
    assert_not Period.new(project: @project, stage: @stage).save
  end

  test "should save period with auto input start_at" do
    @period.save
    assert @period.start_at
  end
end
