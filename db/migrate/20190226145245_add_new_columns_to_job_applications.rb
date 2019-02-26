class AddNewColumnsToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :years_experience, :integer
    remove_column :job_applications, :education
  end
end
