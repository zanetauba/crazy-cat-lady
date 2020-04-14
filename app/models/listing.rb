class Listing < ApplicationRecord
  belongs_to :user
  has_many :listing_photos, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :guests, through: :bookings, source: :user, dependent: :destroy

end
