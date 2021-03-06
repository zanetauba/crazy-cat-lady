class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :guests, through: :bookings, source: :user, dependent: :destroy
  has_many_attached :photos
  has_many :reviews, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
