class ChangeCheckboxName < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :checkbox, :email_checkbox
  end
end
