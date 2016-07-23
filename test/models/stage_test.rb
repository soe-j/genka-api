require 'test_helper'

class StageTest < ActiveSupport::TestCase
  setup do
    @stage = stages(:one)
  end

  test "should save stage" do
    assert @stage.save
  end

  test "should not save stage without name" do
    noname_stage = Stage.new
    assert_not noname_stage.save
  end

  test "should not save same name stage" do
    @stage.save
    same_name_stage = Stage.new(name: @stage.name)
    assert_not same_name_stage.save
  end

  test "should save with name with only Alphanumeric" do
    alphanumeric_name_stage = Stage.new(name: "engLISH123")
    assert alphanumeric_name_stage.save

    %w(日本語 abc@def _dec aka:d <ab>).each do |bad_name|
      assert_not Stage.new(name: bad_name).save
    end
  end
end
