json.array!(@users) do |user|
  json.extract! user, :id, :email, :password, :password_confirmation, :role_id
  json.url user_url(user, format: :json)
end
