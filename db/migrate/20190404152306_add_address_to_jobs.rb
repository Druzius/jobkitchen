class AddAddressToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :address, :string
  end
end
