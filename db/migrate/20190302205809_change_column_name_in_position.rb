class ChangeColumnNameInPosition < ActiveRecord::Migration[5.2]
  def change
    rename_column :positions, :categories_id, :category_id
  end
end
