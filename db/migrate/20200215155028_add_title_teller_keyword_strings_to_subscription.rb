class AddTitleTellerKeywordStringsToSubscription < ActiveRecord::Migration[6.0]
  def change
    add_column :subscriptions, :title, :string
    add_column :subscriptions, :teller, :string
    add_column :subscriptions, :keyword, :string
  end
end
