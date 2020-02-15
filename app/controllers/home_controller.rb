class HomeController < ApplicationController
	def home
		if current_user
			@notifications = current_user.subscriptions.to_a.collect{|v| v.notifications.to_a }.flatten
		end
	end
end
