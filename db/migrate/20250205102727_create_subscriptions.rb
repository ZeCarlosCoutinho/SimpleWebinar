class CreateSubscriptions < ActiveRecord::Migration[8.0]
  def change
    create_table :subscriptions do |t|
      t.timestamps
      t.boolean :watched, default: false
      t.string :email, limit: 191
      t.string :firstname
      t.string :surname
      t.string :registration_ip

      t.belongs_to :broadcast, foreign_key: true, index: { name: "broadcast_id" }
    end

    add_index :subscriptions, :email, unique: true, name: "index_subscriptions_on_email"
  end
end
