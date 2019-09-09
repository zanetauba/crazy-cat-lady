class RemoveEndingAtFromListings < ActiveRecord::Migration[5.2]
  def change
    remove_column :listings, :ending_at
  end
end
