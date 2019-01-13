class AddWorkExperienceToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :work_experience, :text
  end
end
