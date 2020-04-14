class AddDefaultValueToBookingsAccepted < ActiveRecord::Migration[5.2]
  def change
    change_column :bookings, :accepted, :boolean, :default => false
  end
end
