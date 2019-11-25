json.extract! room, :id, :category, :name, :created_at, :updated_at, :host_id
json.url room_url(room, format: :json)
