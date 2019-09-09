class RemoveAcceptedFromListings < ActiveRecord::Migration[5.2]
  def change
        remove_column :listings, :accepted

  end
end
