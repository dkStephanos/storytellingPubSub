class Subscription < ApplicationRecord
	belongs_to :user
	has_many :notifications, dependent: :delete_all

	enum subscription_type: [:title, :teller, :keyword]
end
