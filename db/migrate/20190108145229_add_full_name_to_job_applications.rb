class AddFullNameToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :full_name, :string
  end
end
