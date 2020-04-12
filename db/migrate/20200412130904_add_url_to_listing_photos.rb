class AddUrlToListingPhotos < ActiveRecord::Migration[5.2]
  def change
    add_column :listing_photos, :url, :string
  end
end
