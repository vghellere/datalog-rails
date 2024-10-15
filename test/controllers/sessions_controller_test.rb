require "test_helper"

class SessionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_1 = users(:user_1)
  end

  def sign_user_in(email, password)
    post sessions_path, params: { email: email, password: password }
  end

  test "should get new" do
    get new_session_path
    assert_response :success
  end

  test "should create the session on sign in" do
    sign_user_in @user_1.email, "testpassword"

    assert_equal @user_1.id, session[:user_id]
  end

  test "should redirect the user to the root page on sign in" do
    sign_user_in @user_1.email, "testpassword"

    assert_redirected_to root_path, status: :redirect
  end

  test "should display flash on wrong sign in credentials" do
    sign_user_in @user_1.email, "wrongpasswd"

    assert_equal "Email or password is invalid", flash[:alert]
  end

  test "should display flash on successful sign in" do
    sign_user_in @user_1.email, "testpassword"

    assert_equal "Logged in!", flash[:notice]
  end

  test "should destroy the session and redirect user to the root_path" do
    sign_user_in @user_1.email, "testpassword"

    assert_equal @user_1.id, session[:user_id]

    get logout_path

    assert_nil session[:user_id]
  end
end
