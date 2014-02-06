class ApiSessionToken


  def initialize(token)
    @token = token
  end

  def user
    user_id = Rails.cache.read(_user_id_key)
    User.find(user_id) if user_id
  end

  def user=(user)
    Rails.cache.write(_user_id_key, user.id)
  end


  def _user_id_key
    "session_token/#{ @token }/user_id"
  end
end