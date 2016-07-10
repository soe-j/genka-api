require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  setup do
    @member = members(:one)
  end

  test "should save member" do
    assert @member.save
  end

  test "should not save member without name" do
    noname_member = Member.new
    assert_not noname_member.save
  end

  test "should not save same name member" do
    @member.save
    same_name_member = Member.new(name: @member.name)
    assert_not same_name_member.save
  end

  test "should save with name with only Alphanumeric" do
    alphanumeric_name_member = Member.new(name: "engLISH123")
    assert alphanumeric_name_member.save

    %w(日本語 abc@def _dec aka:d <ab>).each do |bad_name|
      assert_not Member.new(name: bad_name).save
    end
  end
end
