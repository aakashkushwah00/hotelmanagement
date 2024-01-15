require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  test "forgot_password_email" do
    mail = UserMailer.forgot_password_email
    assert_equal "Forgot password email", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
