class Listing < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :guests, through: :bookings, source: :user, dependent: :destroy
  has_many_attached :photos

end
