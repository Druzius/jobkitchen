class RemoveLastNameFromJobApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :job_applications, :last_name, :string
  end
end
