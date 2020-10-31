json.extract! recept, :id, :name, :recept_type_id, :created_at, :updated_at
json.url recept_url(recept, format: :json)
