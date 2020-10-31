json.extract! recept_connect, :id, :recept_id, :material_id, :size_id, :created_at, :updated_at
json.url recept_connect_url(recept_connect, format: :json)
