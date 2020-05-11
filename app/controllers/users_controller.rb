class UsersController < ApplicationController
   #  before_action :set_listing
#     before_action :set_booking


  def dashboard
    #@booking = Booking.find(params[:id])
    @user = current_user
    @requests = @user.requests
    @user_booking =  @user.listings.first.bookings.first
    @amount_of_days = @user_booking.ending_at - @user_booking.starting_at
    @price_per_day = @user.listings.first.price_per_day
    @to_be_paid = @amount_of_days.to_i * @price_per_day.to_i

  end

#private

  #def set_listing
   # @listing = Listing.find(params[:listing_id])
 # end

  #def set_booking
   # @booking = Booking.find(params[:id])
 # end


end
