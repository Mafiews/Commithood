class Event < ApplicationRecord
  belongs_to :ngo
  has_one_attached :photo
  has_many :participations
  has_many :users, through: :participations
  validates :name, :start_date, :end_date, :description, :seats, :address, presence: true
  # Kally : seats validation
  validates :seats, numericality: { greater_than: 0 }
  validates :seats_left, numericality: { greater_than_or_equal_to: 0 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
