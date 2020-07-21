class Review < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  belongs_to :booking
  validates :content, presence: true
  validates :rating, presence: true
end
