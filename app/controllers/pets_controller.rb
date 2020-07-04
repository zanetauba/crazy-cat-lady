class PetsController < ApplicationController

  def index
    @pets = Pet.all
  end

  def new
    @pet = Pet.new
  end




  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user


    if @pet.name !=nil && @pet.photo_url != nil && @pet.name != "" && @pet.photo_url.attached?
     @pet.save
      redirect_to pet_path(@pet)

    else
    flash[:alert] = 'Fill out all the required fields'

    render 'new'
  end
  end

  def edit
  end

  def update
    @pet.update(pet_params)
  end

  def destroy
    @pet.destroy
  end

  def show
    @pet = Pet.find(params[:id])        # GET /bookings/:id
  end

private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :photo_url, :user_id)
  end


end
