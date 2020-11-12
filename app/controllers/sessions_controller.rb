class SessionsController < ApplicationController

  def new
    @error_login
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      @error_login = false
      session[:user_id] = user.id
      redirect_to '/'
    else
      @error_login = true
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
