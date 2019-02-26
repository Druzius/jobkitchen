module JobsHelper

  def job_type(job_type)
    if job_type == "ייעוץ, מכירות ושיווק"
      content_tag :span, "#{job_type}", class: "tag link is-medium"
    elsif job_type == "מקצועות המטבח"
      content_tag :span, "#{job_type}", class: "tag success is-medium"
    elsif job_type == "מקצועות כלליים"
      content_tag :span, "#{job_type}", class: "tag blue is-medium"
    elsif job_type == "מקצועות ניהול ומנהלה"
      content_tag :span, "#{job_type}", class: "tag primary is-medium"
    elsif job_type == "מקצועות שירות ואירוח"
      content_tag :span, "#{job_type}", class: "tag info is-medium"
    else
      ""
    end
  end

  def job_author(job)
    user_signed_in? && current_user.id == job.user_id
  end
end
