module SessionsHelper
  def login(user)
    session[:session_key] = user.id
  end

  def current_user
    @current_user ||= User.find_by(id: session[:session_key])
  end

  def logged_in?
    !current_user.nil?
  end

  def is_admin?
    current_user.permission_level > 2
  end

  def logout
    session.delete(:session_key)
    @current_user = nil
  end

end
