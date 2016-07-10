require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  setup do
    @project = projects(:one)
  end

  test "should save project" do
    assert @project.save
  end

  test "should not save project without name" do
    noname_project = Project.new
    assert_not noname_project.save
  end

  test "should not save same name project" do
    @project.save
    same_name_project = Project.new(name: @project.name)
    assert_not same_name_project.save
  end

  test "should save with name with only Alphanumeric" do
    alphanumeric_name_project = Project.new(name: "eng123")
    assert alphanumeric_name_project.save
    non_alphanumeric_name_project = Project.new(name: "日本語")
    assert_not non_alphanumeric_name_project.save
  end
end
