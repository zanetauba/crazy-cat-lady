class UsersController < ApplicationController
   #  before_action :set_listing
#     before_action :set_booking


  def dashboard
    #@booking = Booking.find(params[:id])
    @user = current_user
    @requests = @user.requests
    @booking_info = @user.booking_info
    @ongoing_bookings = @user.bookings.where(['ending_at >= ? and starting_at <= ? and accepted = true',  DateTime.now, DateTime.now])
    @upcoming_bookings = @user.bookings.where(['starting_at >= ?',  DateTime.now])
    @expired_bookings = @user.bookings.where(['starting_at < ? and ending_at < ? and accepted = true', DateTime.now, DateTime.now]) + @user.bookings.where(['starting_at < ? and accepted = false', DateTime.now])

    @ongoing_hostings = @booking_info.where(['ending_at >= ? and starting_at <= ? and accepted = true',  DateTime.now, DateTime.now])
    @upcoming_hostings = @booking_info.where(['starting_at > ?',  DateTime.now])
    @expired_hostings = @booking_info.where(['starting_at < ? and ending_at < ? and accepted = true', DateTime.now, DateTime.now])

    @requests_to_accept = @requests.where(['starting_at >= ? and accepted = false',  DateTime.now])
    @expired_requests = @requests.where(['starting_at < ? and accepted = false', DateTime.now])

    #@pet_id_booking = @booking_info.pet_id
    #@guest_pet = Pet.find(@pet_id_booking)

    #if @user.listings.present?
      #@hosted_listings =  @user.listings
     # @booked_listings = @user.booking_info
    #end
  end

  def show
    @user = User.find(params[:id])
    @average_user_rating = @user.my_reviews.average(:rating)
    @number_of_ratings = @user.my_reviews.count
    # GET /bookings/:id
  end

private

  def user_params
    params.require(:user).permit(:name, :surname, :email, :avatar)
  end
  #def set_listing
   # @listing = Listing.find(params[:listing_id])
 # end

  #def set_booking
   # @booking = Booking.find(params[:id])
 # end


end
