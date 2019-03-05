class AddHebrewToCategory < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :hebrew, :string
  end
end
