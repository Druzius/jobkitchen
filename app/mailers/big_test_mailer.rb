class BigTestMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.big_test_mailer.test_mail.subject
  #
  def test_mail(user)
    @user = user

    mail(to: @user.email, subject: 'Welcome to Job Kitchen')
  end
end
