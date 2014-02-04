class SessionsController < Devise::SessionsController
  prepend_view_path "app/views/devise"

  def new
    super
  end

  def create
    super
  end

end
