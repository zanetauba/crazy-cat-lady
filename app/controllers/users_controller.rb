class UsersController < ApplicationController
   #  before_action :set_listing
#     before_action :set_booking


  def dashboard
    #@booking = Booking.find(params[:id])
    @user = current_user
    @requests = @user.requests
    @booking_info = @user.booking_info
    @upcoming_bookings = @user.bookings.where(['ending_at >= ?', DateTime.now])
    @expired_bookings = @user.bookings.where(['ending_at < ?', DateTime.now])

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
