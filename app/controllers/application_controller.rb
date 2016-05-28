class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_filter :current_user, :permission_check, :check_if_redirect

  # addresses that can ONLY be accessed while logged out
  def outside_path?(param)
    outside_addresses = [
      "/login",
      "/signup",
      "/" # equivalent to /login
    ]
    outside_addresses.any?{ |path| path == param }
  end

  # check if action is permitted when not logged in
  def unauthenticated_action?(controller, action)
    controller == "users" && action == "create"
  end

  # addresses that can be accessed while account requires confirming
  def confirm_path?(param)
    confirm_addresses = [
      "/confirm"
    ]
    confirm_addresses.any?{ |path| path == param }
  end

  # check if one of the confirm post actions is called
  def confirm_post_action?(controller, action)
    controller == "users" && action == "send_confirmation_email"
  end

  # check if one of the confirm email actions is called
  def confirm_email_action?(controller, action)
    controller == "users" && action == "confirm_account"
  end

  # addresses that should never be redirected
  def full_access_path?(param)
    full_access_addresses = [
      "/logout"
    ]
    full_access_addresses.any?{ |path| path == param }
  end

  def current_user
    @current_user ||= User.find_by(id: session[:session_key])
  end

  def permission_check
    @permission = @current_user!=nil ? @current_user.permission_level : 0
  end

  # check if the user's account is confirmed
  def account_confirmed?
    current_user.confirmation_token && current_user.confirmation_expiry.nil?
  end

  # Check if redirecting the user is required
  def check_if_redirect
    # get the current controller and action for the path
    controller = controller_name
    action = action_name

    # handle user pathing
    if !full_access_path?(request.path)
      # trying to access path outside of the authenticated zone
      if outside_path?(request.path) || unauthenticated_action?(controller, action)
        redirect_to @current_user if logged_in?
      # trying to access confirmation pages
      elsif confirm_path?(request.path) || confirm_post_action?(controller, action)
        if !logged_in?
          redirect_to :login
        elsif account_confirmed?
          redirect_to @current_user
        end
      # trying to access any other page
      else
        if !logged_in?
          redirect_to :login
        elsif !confirm_email_action?(controller, action) && !account_confirmed?
          redirect_to :confirm
        end
      end
    end
  end

  # Check if trying to access the admin page as a non-admin
  def check_if_admin_access
    if request.path == "/admin" && current_user.permission_level <= 2
      redirect_to :back
    end
  end
end
