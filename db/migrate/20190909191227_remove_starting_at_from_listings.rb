class RemoveStartingAtFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :starting_at
  end
end
