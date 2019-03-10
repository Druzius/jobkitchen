class RemoveDatetimeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :expires_at
  end
end
