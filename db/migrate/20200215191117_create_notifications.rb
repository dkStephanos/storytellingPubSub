class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.integer :subscription_id
      t.integer :tell_id

      t.timestamps
    end
  end
end
