class Api::SessionsController < ApiController

  respond_to :json

  def create
    user = User.where(email: params[:email]).first
    if already_logged_in?

    end
  end


  protected

  def invalid_login_attempt
    render :json => {:success => false, :message=> "Error with your login or password" }, :status => 401
  end


  def already_logged_in?

  end



end

#curl -i -H "Accept: application/json" -H "Content-Type: application/json"-H "EMAIL:prashant@example.com" -d "email=prashant@gmail.com" http://localhost:5000/api/sessions.json


# curl -i -H "EMAIL: prashant@gmail.com" -H "Accept: application/json" -d "email=prashant@gmail.com&password=sazsazwq" http://localhost:5000/api/sessions.json

# The EMAIL header is available inside HTTP_EMAIL in the request object