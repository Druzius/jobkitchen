class AddCcTokenAndCc4DigitsandCcPayerNameAndCcPayerIdAndCcExpireMonthAndCcExpireYearAndCcTypeIdAndCcTypeNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cc_token, :string
    add_column :users, :cc_4_digits, :string
    add_column :users, :cc_payer_name, :string
    add_column :users, :cc_payer_id, :string
    add_column :users, :cc_expire_month, :string
    add_column :users, :cc_expire_year, :string
    add_column :users, :cc_type_id, :string
    add_column :users, :cc_type_name, :string
  end
end
