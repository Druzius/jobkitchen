class AddJobApplicationsToJobs < ActiveRecord::Migration[5.2]
  def change
    add_reference :jobs, :job_applications, foreign_key: true
  end
end
