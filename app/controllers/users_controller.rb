class UsersController < ApplicationController
   #  before_action :set_listing
#     before_action :set_booking


  def dashboard
    #@booking = Booking.find(params[:id])
    @user = current_user
    @requests = @user.requests
    @hosted_listings =  @user.listings
    @booked_listings = @user.booking_info
    if @hosted_listings.present?
     # @hosted_listings.each do |hl|
      #  @booked_listings =  hl.bookings
     #   @booked_listings.each do |bl|
          @price_per_day = @hosted_listings.first.price_per_day

            #@amount_of_days = @booked_listings.first.ending_at - @booked_listings.first.starting_at
            @to_be_paid = @amount_of_days.to_i * @price_per_day.to_i
         # end
       # end
      end
end
#private

  #def set_listing
   # @listing = Listing.find(params[:listing_id])
 # end

  #def set_booking
   # @booking = Booking.find(params[:id])
 # end


end
