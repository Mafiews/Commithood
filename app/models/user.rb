class User < ApplicationRecord
  acts_as_voter
  has_many :user_causes
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :phone_number, presence: true
  has_one_attached :photo

  # yizhu: geocode
  # geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?
end
