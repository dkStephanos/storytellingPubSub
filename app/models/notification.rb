class Notification < ApplicationRecord
	belongs_to :subscription
	belong_to :tell
end
