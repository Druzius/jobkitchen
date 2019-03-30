class JobApplicationMailer < ApplicationMailer
  def apply(job_application)
    @job_application = job_application  # Instance variable => available in view

    mail(to: @job_application.email, subject: 'Thanks for applying')
    # This will render a view in `app/views/user_mailer`!
  end
end
