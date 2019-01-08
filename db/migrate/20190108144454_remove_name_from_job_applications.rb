class RemoveNameFromJobApplications < ActiveRecord::Migration[5.2]
  def change
    remove_column :job_applications, :name, :string
  end
end
