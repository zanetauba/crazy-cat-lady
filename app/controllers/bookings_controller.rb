
class BookingsController < ApplicationController
     before_action :set_listing, only: [:new, :create, :destroy, :edit, :final_price]
     before_action :set_booking, only: [:show, :edit, :update, :destroy, :confirm, :final_price]
     attr_accessor :show

  def index
    @bookings = Booking.all
  end



  def show
    @booking = Booking.find(params[:id])
    @amount_of_days = @booking.ending_at - @booking.starting_at
    @to_pay = @amount_of_days.to_i * @booking.listing.price_per_day.to_i
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = @listing
    @booking.user = current_user
    if @booking.starting_at < @booking.ending_at && @booking.starting_at > Date.today
      @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
    end

  def confirm
    @booking = Booking.find(params[:id])
    @booking.update(accepted: true)

    redirect_to root_path
  end


  def accept
    @booking = Booking.find(params[:id])
    @booking.update(accepted: true)

    redirect_to dashboard_path
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
