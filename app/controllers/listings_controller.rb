class ListingsController < ApplicationController



  def index         # GET /bookings
    @listings = Listing.all
  end

  def show          # GET /bookings/:id
  end

  def new           # GET /bookings/new
    @listing = Listing.new
  end

  def create        # POST /bookings
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    @listing.save
  end

  def edit          # GET /bookings/:id/edit
  end

  def update        # PATCH /bookings/:id
    @listing.update(params[:listing])
  end

  def destroy       # DELETE /bookings/:id
    @listing.destroy
  end


private

  def listing_params
    params.require(:listing).permit(:title, :description, :price_per_day, :location)
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end




end