class AddPhonesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :job_phone, :string
  end
end
