if @user.present?
  json.user do
    json.id @user.id
    json.username @user.username
    json.realname @user.real_name
    json.user_session_key @object_key
  end
end
