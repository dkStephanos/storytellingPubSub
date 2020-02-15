class Notification < ApplicationRecord
	belongs_to :subscription
	belongs_to :tell
end
