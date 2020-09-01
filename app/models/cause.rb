class Cause < ApplicationRecord
  has_many :user_causes
  has_many :ngo_causes
  has_many :users, through: :user_causes
  has_many :ngos, through: :ngo_causes
  has_many :event_causes
  has_many :events, through: :event_causes

  CAUSES = ["Tous les thèmes", "Environnement", "Jeunesse", "Bien-être animal", "Précarité", "Isolement", "Personnes âgées", "Santé", "Culture", "Sport", "Formation"]

  validates :name, inclusion: { in: CAUSES, allow_nil: false }
end
