class ChangeYearsExperienceToBeStringInJobApplications < ActiveRecord::Migration[5.2]
  def change
    change_column :job_applications, :years_experience, :string
  end
end
