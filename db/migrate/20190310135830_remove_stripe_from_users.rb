class RemoveStripeFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :stripe_id
    remove_column :users, :card_brand
    remove_column :users, :card_last4
    remove_column :users, :card_exp_month
    remove_column :users, :card_exp_year
  end
end
