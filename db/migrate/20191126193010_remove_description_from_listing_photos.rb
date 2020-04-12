class RemoveDescriptionFromListingPhotos < ActiveRecord::Migration[5.2]
  def change
    remove_column :listing_photos, :description, :string
  end
end
