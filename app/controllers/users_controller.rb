class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)

    if user.save
      @error_signup = false
      session[:user_id] = user.id
      redirect_to '/'
    else
      @error_signup = true
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
