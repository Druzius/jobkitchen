class JobApplicationMailer < ApplicationMailer
  def apply(job_application)
    @job_application = job_application  # Instance variable => available in view

    mail(to: @job_application.email, subject: 'קורות החיים נשלחו בהצלחה')
    # This will render a view in `app/views/user_mailer`!
  end

  def email_with_attachment
    @job_application = job_application  # Instance variable => available in view

    if resume.present?
      attachments['42.jpg'] = File.read("/path/to/file") # Attached file
    end

    mail(to: @job_application.job_id.user_id.email, subject: 'somebody applied to your job posting')
  end
end
