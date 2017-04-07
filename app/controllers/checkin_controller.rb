class CheckinController < ApplicationController
  def new
    @checkin = Checkin.new
  end

  def create
    checkin_params[:user_id] = @current_user.id
    render json: Checkin.create(checkin_params)
    # redirect_to "/users/show"
  end

  private

  def checkin_params
    params.require(:checkin).permit(:start_time, :end_time, :user_id)
  end
end
