class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :permission_check
  before_filter :current_user

  def current_user
    @current_user ||= User.find_by(id: session[:session_key])
  end

  def permission_check
    @permission = @current_user!=nil ? @current_user.permission_level : 0
  end
end
