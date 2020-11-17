class SessionsController < ApplicationController

  def new
    @error_login
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])

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
