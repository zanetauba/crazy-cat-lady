class UsersController < ApplicationController


  def dashboard
    @user = current_user
    @requests = @user.requests
    @booking_info = @user.booking_info
    @ongoing_bookings = @user.bookings.where(['ending_at >= ? and starting_at <= ? and accepted = true',  DateTime.now, DateTime.now])
    @upcoming_bookings = @user.bookings.where(['starting_at > ?',  DateTime.now])
    @expired_bookings = @user.bookings.where(['starting_at < ? and ending_at < ? and accepted = true', DateTime.now, DateTime.now]) + @user.bookings.where(['starting_at < ? and accepted = false', DateTime.now])

    @ongoing_hostings = @booking_info.where(['ending_at >= ? and starting_at <= ? and accepted = true',  DateTime.now, DateTime.now])
    @upcoming_hostings = @booking_info.where(['starting_at > ?',  DateTime.now])
    @expired_hostings = @booking_info.where(['starting_at < ? and ending_at < ? and accepted = true', DateTime.now, DateTime.now])

    @requests_to_accept = @requests.where(['starting_at >= ? and accepted = false',  DateTime.now])
    @expired_requests = @requests.where(['starting_at < ? and accepted = false', DateTime.now])

  end

  def show
    @user = User.find(params[:id])
    @average_user_rating = @user.my_reviews.average(:rating)
    @number_of_ratings = @user.my_reviews.count
  end

private

  def user_params
    params.require(:user).permit(:name, :surname, :email, :avatar)
  end

end
