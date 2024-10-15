require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get home_index_path
    assert_response :success
  end

  test "should display logged in header" do
    user_1 = users(:user_1)
    post sessions_path, params: { email: user_1.email, password: "testpassword" }
    get home_index_path
    assert_select "#user_header a[href=?]", logout_path, { count: 1, text: "Log Out" }
  end

  test "should display logged out header" do
    get home_index_path
    assert_select "#user_header a[href=?]", login_path, { count: 1, text: "Log In" }
  end
end
