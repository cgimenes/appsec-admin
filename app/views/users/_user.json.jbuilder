json.extract! user, :id, :email, :fullname, :role, :created_at, :updated_at
json.url user_url(user, format: :json)
