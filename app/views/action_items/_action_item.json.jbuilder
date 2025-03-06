json.extract! action_item, :id, :name, :completed, :one_to_one_id, :created_at, :updated_at
json.url action_item_url(action_item, format: :json)
