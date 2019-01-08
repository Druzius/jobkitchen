class AddEducationToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :education, :text
  end
end
