require 'test_helper'

class PeriodTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
    @stage   = stages(:one)
    @member  = members(:one)
    @period = Period.new(
      project: @project,
      stage:   @stage,
      member:  @member,
      start_at: DateTime.now
    )
  end

  test "should save period" do
    assert @period.save
  end

  test "should not save period without project" do
    assert_not Period.new(stage: @stage, member: @member, start_at: DateTime.now).save
  end

  test "should not save period without stage" do
    assert_not Period.new(project: @project, member: @member, start_at: DateTime.now).save
  end

  test "should not save period without member" do
    assert_not Period.new(project: @project, stage: @stage, start_at: DateTime.now).save
  end

  test "should save period with auto input start_at" do
    assert Period.new(project: @project, stage: @stage, member: @member).save
    assert @period.start_at
  end

  test "should save period with start_at" do
    start_at_str = '201610201122'
    period = Period.new(project: @project, stage: @stage, member: @member, start_at: start_at_str)
    assert period.save
    assert_equal period.start_at, DateTime.parse(start_at_str)
  end

  test "should not save period with invalid start_at" do
    assert_not Period.new(project: @project, stage: @stage, member: @member, start_at: '20161020112').save
  end
end
