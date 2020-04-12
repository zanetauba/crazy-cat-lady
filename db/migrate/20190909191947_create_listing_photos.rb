class CreateListingPhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :listing_photos do |t|
      t.references :listing, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
