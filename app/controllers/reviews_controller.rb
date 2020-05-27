class ReviewsController < ApplicationController
     before_action :set_listing, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.listing = @listing

    if @review.save
      redirect_to listing_path(@review.listing)
    else
      flash[:alert] = "Something went wrong."
      #render :new
    end
  end

  private

    def set_listing
      @listing = Listing.find(params[:listing_id])
    end


  def review_params
    params.require(:review).permit(:content, :rating, :user_id, :listing_id)
  end

end
