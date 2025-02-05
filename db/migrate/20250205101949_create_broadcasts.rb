class CreateBroadcasts < ActiveRecord::Migration[8.0]
  def change
    create_table :broadcasts do |t|
      t.timestamps
      t.string :title
      t.datetime :broadcast_date
      t.integer :subscriptions_count, default: 0
    end
  end
end
