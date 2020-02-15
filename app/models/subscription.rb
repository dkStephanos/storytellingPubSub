class Subscription < ApplicationRecord
	belongs_to :user
	has_many :notifications

	enum subscription_type: [:title, :teller, :keyword]
end
