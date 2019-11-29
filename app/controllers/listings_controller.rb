class ListingsController < ApplicationController



  def index         # GET /bookings
    @bookings = Booking.all
  end

  def show          # GET /bookings/:id
  end

  def new           # GET /bookings/new
    @booking = Booking.new
  end

  def create        # POST /bookings
    @booking = Booking.new(params[:booking])
    @booking.save
  end

  def edit          # GET /bookings/:id/edit
  end

  def update        # PATCH /bookings/:id
    @booking.update(params[:booking])
  end

  def destroy       # DELETE /bookings/:id
    @booking.destroy
  end


private

  def booking_params
    params.require(:booking).permit(:starting_at, :ending_at)

  def set_booking
    @booking = Booking.find(params[:id])
  end

end


end
