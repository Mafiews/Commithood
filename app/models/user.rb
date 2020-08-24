class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_causes
  has_many :participations
  has_many :events, through: :participations

  validates :first_name, :last_name, :phone_number, presence: true
end
