class RemoveTitleFromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :title, :string
  end
end
