class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :starting_at, presence: true
  validates :ending_at, presence: true
  validates :pet_id, presence: true
  has_many :reviews
  belongs_to :pet
  #has_many :pets, through: :user, source: :pets




end
