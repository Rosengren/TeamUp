module SessionsHelper
  def login(user)
    session[:session_key] = user.id
  end
end
