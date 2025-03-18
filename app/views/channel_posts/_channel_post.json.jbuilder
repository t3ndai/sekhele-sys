json.extract! channel_post, :id, :creator_id, :likes, :channel_id, :created_at, :updated_at
json.url channel_post_url(channel_post, format: :json)
