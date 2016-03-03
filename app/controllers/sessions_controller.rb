class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username])
    #try to login
    if user && user.authenticate(params[:session][:password])
      #LogIn
      flash.now[:danger] = 'HOORAY'
      render 'new'
    else
      flash.now[:danger] = 'Incorrect username/password combination'
      render 'new'
    end
  end

  def destroy
  end
end
