class User < ApplicationRecord
  has_many :user_causes
  has_many :participations, dependent: :destroy
  has_many :events, through: :participations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :phone_number, presence: true
end
