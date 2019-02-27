class AddSubCategoriesToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :sub_categories, :string
  end
end
