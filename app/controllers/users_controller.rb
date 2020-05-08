class UsersController < ApplicationController

  def dashboard
    #@booking = Booking.find(params[:id])
    @user = current_user
    @requests = @user.requests
  end

end
