require 'test_helper'

class MembersControllerTest < ActionController::TestCase
  setup do
    @member = members(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:members)
  end

  test "should create member" do
    assert_difference('Member.count') do
      post :create, member: { name: @member.name }
    end
    assert_response :created
  end

  test "should show member" do
    get :show, id: @member
    assert_response :success
  end

  test "should destroy member" do
    assert_difference('Member.count', -1) do
      delete :destroy, id: @member
    end
    assert_response :no_content
  end
end
