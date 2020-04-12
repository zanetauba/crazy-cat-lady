class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.integer :price_per_day
      t.date :starting_at
      t.date :ending_at
      t.boolean :accepted
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
