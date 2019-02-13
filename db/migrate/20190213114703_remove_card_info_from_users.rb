class RemoveCardInfoFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :cc_token, :string
    remove_column :users, :cc_4_digits, :string
    remove_column :users, :cc_payer_name, :string
    remove_column :users, :cc_payer_id, :string
    remove_column :users, :cc_expire_month, :string
    remove_column :users, :cc_expire_year, :string
    remove_column :users, :cc_type_id, :string
    remove_column :users, :cc_type_name, :string
  end
end
