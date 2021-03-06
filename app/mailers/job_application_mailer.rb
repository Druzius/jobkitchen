class JobApplicationMailer < ApplicationMailer
  def apply(job_application)
    @job_application = job_application  # Instance variable => available in view

    mail(to: @job_application.email, subject: 'קורות החיים שלך נשלחו בהצלחה!')
    # This will render a view in `app/views/user_mailer`!
  end

  def email_with_attachment(job_application)
    @job_application = job_application  # Instance variable => available in view

    mail(to: @job_application.job.user.email, subject: "פניה למשרתכם בג'וב קיטצ'ן")
  end
end
