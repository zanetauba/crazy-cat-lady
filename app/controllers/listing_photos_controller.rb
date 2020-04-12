class ListingPhotosController < ApplicationController
  before_action :set_listing, only: [:new, :create, :show, :destroy, :edit]


  def index
    @listing_photos = ListingPhoto.all
  end

  def new
    @listing_photo = ListingPhoto.new
  end

  def create
    @listing_photo = ListingPhoto.new(listing_photo_params)
    @listing_photo.listing = @listing
    if @listing_photo.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @listing_photo.update(listing_photo_params)
  end

  def destroy
    @listing_photo.destroy
  end

private

  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def listing_photo_params
    params.require(:listing_photo).permit(:url, :quote_id)
  end
end
