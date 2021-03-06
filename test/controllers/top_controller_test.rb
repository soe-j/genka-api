require 'test_helper'

class TopControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should route to top index" do
    assert_routing '/', controller: "top", action: "index", format: "json"
  end
end
