class AddCategoryToPositions < ActiveRecord::Migration[5.2]
  def change
    add_reference :positions, :categories, foreign_key: true
  end
end
