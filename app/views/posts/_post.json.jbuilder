json.extract! post, :id, :message, :url, :created_at, :updated_at
json.url post_url(post, format: :json)
