class Subscription < ApplicationRecord
	belongs_to :user

	enum subscription_type: [:title, :teller, :keyword]
end
