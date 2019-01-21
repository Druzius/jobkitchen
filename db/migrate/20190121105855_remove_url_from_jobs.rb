class RemoveUrlFromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :url, :string
  end
end
