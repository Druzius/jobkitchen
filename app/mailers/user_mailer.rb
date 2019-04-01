class UserMailer < ApplicationMailer
  def welcome(user)
    @user = user  # Instance variable => available in view
    # @user = params[:user]
    mail(to: @user.email, subject: "ברוכים הבאים לג'וב קיטשן")
    # This will render a view in `app/views/user_mailer`!

  end

  def job_posted(user)
    @user = user
    # @user = params[:user]
    mail(to: @user.email, subject: 'You succesfully created a job listing')
  end
end
