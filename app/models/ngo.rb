class Ngo < ApplicationRecord
  has_many :events
  has_many :ngo_causes
  has_many :causes, through: :ngo_causes
  has_many :participations, through: :events

  validates :name, :kbis, :phone_number, :address, presence: true
end
