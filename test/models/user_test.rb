require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not create user with invalid e-mail address" do
    assert_raises ActiveRecord::RecordInvalid, match: "Validation failed: Email is invalid" do
      User.create!({ email: "invalid_email_address", password: "pass" })
    end
  end

  test "should create user with valid e-mail address" do
    user = User.new({ email: "valid@test.com", password: "pass" })
    assert user.save
  end

  test "should add user to the database" do
    valid_address = "valid@test.com"
    assert_nil User.find_by_email(valid_address)

    user = User.create!({ email: valid_address, password: "pass" })

    assert_not_nil User.find_by_email(valid_address)
    assert_equal user.email, valid_address
  end
end
