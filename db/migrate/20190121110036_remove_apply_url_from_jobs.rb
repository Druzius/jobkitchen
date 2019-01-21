class RemoveApplyUrlFromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :apply_url, :string
  end
end
