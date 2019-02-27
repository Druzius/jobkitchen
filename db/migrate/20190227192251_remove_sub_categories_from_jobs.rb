class RemoveSubCategoriesFromJobs < ActiveRecord::Migration[5.2]
  def change
    remove_column :jobs, :sub_categories
    add_column :jobs, :sub_category, :string
  end
end
