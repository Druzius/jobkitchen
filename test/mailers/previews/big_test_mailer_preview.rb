# Preview all emails at http://localhost:3000/rails/mailers/big_test_mailer
class BigTestMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/big_test_mailer/test_mail
  def test_mail
    user = User.first
    BigTestMailer.test_mail(user)
  end

end
