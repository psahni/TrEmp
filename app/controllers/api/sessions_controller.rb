class Api::SessionsController < ApiController

  respond_to :json

  def create
    #logger.debug "---------------------"
    #logger.debug request.headers.inspect
    user = User.where(email: params[:email]).first
    if user && user.valid_password?(params[:password])
      sign_in(:user, user)
      render :json => {:success => true, :auth_token=> user.authentication_token, :email=> user.email}
    else
      invalid_login_attempt
    end
  end


  protected

  def invalid_login_attempt
    render :json => {:success => false, :message=> "Error with your login or password" }, :status => 401
  end

end

#curl -i -H "Accept: application/json" -H "Content-Type: application/json"-H "EMAIL:prashant@example.com" -d "email=prashant@gmail.com" http://localhost:5000/api/sessions.json


# curl -i -H "EMAIL: prashant@gmail.com" -H "Accept: application/json" -d "email=prashant@gmail.com&password=sazsazwq" http://localhost:5000/api/sessions.json

# The EMAIL header is available inside HTTP_EMAIL in the request object