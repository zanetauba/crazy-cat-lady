class ListingsController < ApplicationController



  def index
  if params[:query].present?
    sql_query = " \
    listings.price_per_day <= :query \
    "

    @max_price = params[:query]
    @listings = Listing.where(sql_query, query: "#{params[:query]}").geocoded

        @markers = @listings.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { listing: listing })
      }
    end
  else

      @listings = Listing.geocoded

    @markers = @listings.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { listing: listing })
      }
    end
  end
end

  def show
    @user = current_user     # GET /bookings/:id
    @listing = Listing.find(params[:id])
    @listings = Listing.geocoded
    @markers = @listings.map do |listing|
      {
        lat: @listing.latitude,
        lng: @listing.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { listing: @listing })
      }
    end
  end

  def new           # GET /bookings/new
    @listing = Listing.new
  end

  def create        # POST /bookings
    @listing = Listing.new(listing_params)
    @listing.user_id = current_user.id
    if @listing.save
      redirect_to listing_path(@listing)
    else
      render 'new'
    end
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
    params.require(:listing).permit(:title, :description, :price_per_day, :location, photos: [])
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end




end
