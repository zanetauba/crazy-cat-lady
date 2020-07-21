class ListingsController < ApplicationController
  before_action :initialize_booking
  skip_before_action :authenticate_user!, only: [:index, :initialize_booking]


def initialize_booking
  @booking = Booking.new
  @user = current_user
  if user_signed_in?
    @pets = @user.pets
  end
end


def index
  if params[:max_price_query].present? && params[:location_query].present?

    sql_query = " \
    listings.price_per_day <= :max_price_query \
    "

    @location_query = params[:location_query]
    @max_distance = params[:distance_query]
    @max_price = params[:max_price_query]
    @listings =  Listing.near(@location_query, @max_distance).where(sql_query, max_price_query: "#{params[:max_price_query]}").geocoded

    @markers = @listings.map do |listing|
      {
        lat: listing.latitude,
        lng: listing.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { listing: listing })
      }
      end

      if @listings.first.nil?
        flash[:alert] = 'No results found, please adjust your query or select "Show all"'
        render 'pages/home'
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

  @listing_reviews = @listing.reviews
  @amount_of_reviews = @listing_reviews.count
  @average_rating = @listing_reviews.average(:rating)
end



def new           # GET /bookings/new
  @listing = Listing.new
end


def create        # POST /bookings
  @listing = Listing.new(listing_params)
  @listing.user_id = current_user.id
  if @listing.photos.attached? && @listing.title != "" && @listing.description != "" && @listing.price_per_day != nil
    @listing.save
    redirect_to listing_path(@listing)
  else
  flash[:alert] = 'Fill out all the required fields'
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
