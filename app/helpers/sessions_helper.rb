module SessionsHelper
  def login(user)
    session[:session_key] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:session_key])
  end

end
