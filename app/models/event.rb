class Event < ApplicationRecord
  belongs_to :ngo
  has_one_attached :photo
  has_many :participations
  has_many :users, through: :participations

  validates :name, :start_date, :end_date, :description, :seats, :address, presence: true
end
