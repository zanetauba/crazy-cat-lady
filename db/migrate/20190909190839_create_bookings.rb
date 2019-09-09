class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.references :listing, foreign_key: true
      t.date :starting_at
      t.date :ending_at
      t.boolean :accepted

      t.timestamps
    end
  end
end
