class UserController < ApplicationController
  def create
    # render json: User.create(user_params)
    User.create(user_params)
    redirect_to login_path
  end

  def new
    @user = User.new
    @gyms = Gym.all
  end

  def show
    @user = @current_user
    if @current_user.paycycle > 0
      @paycycle = Paycycle.find(@current_user.paycycle)
    end
    @checkins = Checkin.where(:user_id => @current_user.id)
  end

  def edit
    @user = @current_user
    @paycycles = Paycycle.all
    @gyms = Gym.all
  end

  def update
    u = User.find(@current_user.id)
    u.update(user_params)
    redirect_to "/users/show"
  end

  def wentToGymBeezies
    puts "Hey thare yall gym brethren"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :name, :paycycle, :gym_id)
  end
end
