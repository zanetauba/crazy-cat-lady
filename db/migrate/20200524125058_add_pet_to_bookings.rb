class AddPetToBookings < ActiveRecord::Migration[5.2]
  def change
    add_reference :bookings, :pet, foreign_key: true, null: false
  end
end
