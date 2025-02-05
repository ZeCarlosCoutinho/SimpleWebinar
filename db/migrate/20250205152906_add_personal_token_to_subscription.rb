class AddPersonalTokenToSubscription < ActiveRecord::Migration[8.0]
  def change
    add_column :subscriptions, :personal_token, :string
    add_index :subscriptions, :personal_token, unique: true
  end
end
