class Pet < ApplicationRecord
  belongs_to :user
  has_one_attached :photo_url
  has_many :bookings
  validates :name, presence: true
  validates :photo_url, presence: true
  has_one_attached :photo_url

end
