class AddEmailCheckboxToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :checkbox, :boolean
  end
end
