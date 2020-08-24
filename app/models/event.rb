class Event < ApplicationRecord
  belongs_to :association
  has_many :participations
  has_many :users, through: :participations
end
