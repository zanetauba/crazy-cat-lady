class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @all_listings = Listing.all
    @locations = []
    @all_listings.each do |l|
      @locations << l.location
    end
  end

end
