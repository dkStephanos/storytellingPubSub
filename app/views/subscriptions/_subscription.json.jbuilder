json.extract! subscription, :id, :user_id, :type, :created_at, :updated_at
json.url subscription_url(subscription, format: :json)
