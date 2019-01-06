class AddJobToJobApplications < ActiveRecord::Migration[5.2]
  def change
    add_reference :job_applications, :job, foreign_key: true
  end
end
