class UserController < ApplicationController


  COMMON_YEAR_DAYS_IN_MONTH = [nil, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def days_in_month(month, year = Time.now.year)
     return 29 if month == 2 && Date.gregorian_leap?(year)
     COMMON_YEAR_DAYS_IN_MONTH[month]
  end

  def days_left_in_month(month)
    current_date = Time.new
    date = current_date.day
    return days_in_month(month) - date + 1
  end


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
    gon.num_checkins = @checkins.length
    gon.max_checkins = days_in_month(4)
    gon.days_left = days_left_in_month(4)
    gon.user_id = @current_user.id
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
