class DropListingPhotosTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :listing_photos
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
