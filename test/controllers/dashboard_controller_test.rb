require "test_helper"

class DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should redirect when not logged in index" do
    get dashboard_path
    assert_response :redirect
  end

  test "should get index when logged in" do
    user_1 = users(:user_1)
    post sessions_path, params: { email: user_1.email, password: "testpassword" }

    get dashboard_path
    assert_response :success
  end
end
