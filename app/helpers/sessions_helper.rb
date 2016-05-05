module SessionsHelper
  def login(user)
    session[:session_key] = user.id
    user.set_ip(request.remote_ip)
    @current_user = user
  end

  def current_user
    if (session_key = session[:session_key])
      @current_user ||= User.find_by(id: session_key)
    elsif (session_key = cookies.signed[:session_key])
      user = User.find_by(id: session_key)
      if user && user.authenticated?(cookies[:session_remember])
        login user
      end
    end
  end

  def is_admin?
    current_user.permission_level > 2
  end

	def remember(user)
		user.remember
		cookies.permanent.signed[:session_key] = user.id
		cookies.permanent[:session_remember] = user.remember_token
	end

	def forget(user)
		user.forget
		cookies.delete(:session_key)
		cookies.delete(:session_remember)
	end

  def logged_in?
    !current_user.nil?
  end

  def logout
		forget(current_user)
    session.delete(:session_key)
    @current_user = nil
  end

end
