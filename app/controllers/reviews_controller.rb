class ReviewsController < ApplicationController
     before_action :set_listing, only: [:new, :create]
     before_action :set_booking, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.listing = @listing
    @review.booking = @booking

    if @review.save
      redirect_to listing_path(@review.listing)
    else
      flash[:alert] = "Content and rating cannot be blank"
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

    def set_listing
      @listing = Listing.find(params[:listing_id])
    end

    def set_booking
      @booking = Booking.find(params[:booking_id])
    end

  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :listing_id, :booking_id)
  end

end
