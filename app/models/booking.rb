class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :starting_at, presence: true
  validates :ending_at, presence: true


end
