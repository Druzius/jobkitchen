class AddSummaryToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :job_applications, :summary, :text
  end
end
