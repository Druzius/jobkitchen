require 'test_helper'

class BigTestMailerTest < ActionMailer::TestCase
  test "test_mail" do
    mail = BigTestMailer.test_mail
    assert_equal "Test mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
