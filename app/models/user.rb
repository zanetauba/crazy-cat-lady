class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :pets
  has_many :listings
  has_many :bookings, dependent: :destroy
  has_many :booked_listings, through: :bookings, source: :listing
  has_many :hosted_listings, class_name: 'Listing', dependent: :destroy

end
