
class BookingsController < ApplicationController
     before_action :set_listing, only: [:new, :create, :destroy, :edit, :final_price]
     before_action :set_booking, only: [:show, :edit, :update, :destroy, :confirm, :final_price]
     #before_action :set_pet, only: :show
     attr_accessor :show

  def index
    @bookings = Booking.all
  end



  def show
    @booking = Booking.find(params[:id])
    @pet_id_booking = @booking.pet_id
    @guest_pet = Pet.find(@pet_id_booking)
    @amount_of_days = @booking.ending_at - @booking.starting_at
    @to_pay = @amount_of_days.to_i * @booking.listing.price_per_day.to_i
  end

  def new
    @booking = Booking.new
    @user = current_user
    @pets = @user.pets
    #@pets = current_user.pets
    #@users_pets = User.joins("LEFT JOIN pets ON pets.user_id = users.id")
    #@pets_selection = @users_pets.where("pet.user.id" = "current_user.id")


  end

  def create
    @booking = Booking.new(booking_params)
    @booking.listing = @listing
    @booking.user = current_user
    @pets = @booking.user.pets
    if @booking.starting_at < @booking.ending_at && @booking.starting_at >= Date.today && @booking.pet_id != nil
      @booking.save
      redirect_to booking_path(@booking)
    else
      render 'new'
    end
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

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def booking_params
    params.require(:booking).permit(:starting_at, :ending_at, :accepted, :listing_id, :user_id, :pet_id)
  end


end
