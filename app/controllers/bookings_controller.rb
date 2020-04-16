class BookingsController < ApplicationController
     before_action :set_listing, only: [:new, :create, :destroy, :edit]
     before_action :set_booking, only: [:show, :edit, :update, :destroy, :confirm]


  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = @listing
    @booking.user = current_user
    @booking.save
    redirect_to booking_path(@booking)
  end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.update(accepted: true)

    redirect_to root_path
  end

  private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:starting_at, :ending_at, :accepted, :listing_id, :user_id)
  end


end
