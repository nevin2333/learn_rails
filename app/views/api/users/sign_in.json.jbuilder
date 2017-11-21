json.response @response
if @user.present?
  json.user @user
end
