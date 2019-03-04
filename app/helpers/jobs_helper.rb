module JobsHelper

  def job_type(category)

    if category.name == "General"
      content_tag :span, "#{category.hebrew}", class: "tag link is-medium"
    elsif category.name == "Kitchen"
      content_tag :span, "#{category.hebrew}", class: "tag success is-medium"
    elsif category.name == "Service"
      content_tag :span, "#{category.hebrew}", class: "tag blue is-medium"
    elsif category.name == "Management"
      content_tag :span, "#{category.hebrew}", class: "tag primary is-medium"
    elsif category.name == "Hotel"
      content_tag :span, "#{category.hebrew}", class: "tag info is-medium"
    else
      ""
    end
  end

  def job_author(job)
    user_signed_in? && current_user.id == job.user_id
  end
end
