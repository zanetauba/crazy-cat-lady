class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :authentication_keys => [:email]
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :surname, presence: true
  validates :avatar, presence: true
  has_many :pets
  has_one_attached :avatar
  has_many :listings
  has_many :bookings, dependent: :destroy
  has_many :booked_listings, through: :bookings, source: :listing
  has_many :hosted_listings, class_name: 'Listing', dependent: :destroy


   def requests # Booking request for meals I own
    Booking.joins(:listing).where('listings.user_id' => id).where(accepted: false)
   end

   def booking_info # Booking request for meals I own
    Booking.joins(:listing).where('listings.user_id' => id).where(accepted: true)
   end




end
