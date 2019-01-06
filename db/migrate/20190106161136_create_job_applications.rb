class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.string :name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :city

      t.timestamps
    end
  end
end
