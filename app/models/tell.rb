class Tell < ApplicationRecord
	has_many :notifications, dependent: :delete_all
end
