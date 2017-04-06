class UserController < ApplicationController
  def create
    # render json: User.create(user_params)
    User.create(user_params)
    redirect_to login_path
  end
  
  def new
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
