class PublishListener
  def tell_publish(tell)
  	#Loop through all user subscriptions, and generate a notification for subscription
  	#that matches the tell being created. A blank subscription field is a wildcard for a subscription of that type
  	User.all.each do |user|
  		user.subscriptions.each do |user_subscription|
			case user_subscription.subscription_type
		      #Type = title
		      when "title"
    				if user_subscription.title == "" || user_subscription.title == tell.title
    					user_subscription.notifications.build({"tell_id"=>tell.id})
    					user_subscription.save
    				end
		      #Type = teller
		      when "teller"
		        if user_subscription.teller == "" || user_subscription.teller == tell.tellerName
		          user_subscription.notifications.build({"tell_id"=>tell.id})
		          user_subscription.save
		         end
		      #Type = keyword
		      when "keyword"
    				if user_subscription.keyword == "" || user_subscription.keyword == tell.keyword
    				  user_subscription.notifications.build({"tell_id"=>tell.id})
    				  user_subscription.save
    				end
		      else
		        puts "Something went wrong in TellListener. Couldn't create notifications."
		    end
	 	  end
  	end
  end
end
