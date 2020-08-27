class Event < ApplicationRecord
  acts_as_votable cacheable_strategy: :update_columns

  belongs_to :ngo
  has_one_attached :photo
  has_many :participations
  has_many :users, through: :participations
  validates :name, :start_date, :end_date, :description, :seats, :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
