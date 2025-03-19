json.extract! praise_post, :id, :nominee_id, :nominator_id, :praise_type_id, :message, :channel_id, :created_at, :updated_at
json.url praise_post_url(praise_post, format: :json)
