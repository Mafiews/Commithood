class Association < ApplicationRecord
  has_many :events
  has_many :association_causes
  has_many :causes, through: :association_causes
  has_many :participations, through: :events
end
