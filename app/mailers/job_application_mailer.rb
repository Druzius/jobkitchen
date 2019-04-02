class JobApplicationMailer < ApplicationMailer
  def apply(job_application)
    @job_application = job_application  # Instance variable => available in view

    mail(to: @job_application.email, subject: 'קורות החיים נשלחו בהצלחה')
    # This will render a view in `app/views/user_mailer`!
  end
end
