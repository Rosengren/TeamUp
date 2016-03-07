class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    #try to login
    if user && user.authenticate(params[:session][:password])
      #LogIn
      flash.now[:notice] = 'Logged in Successfully!'
      login user
      redirect_to user #goes to user's profile
    else
      flash.now[:danger] = 'Incorrect username/password combination.'
      render 'new'
    end
  end

  def destroy
    logout
    redirect_to root_url
  end
end
