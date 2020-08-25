class Cause < ApplicationRecord
  has_many :user_causes
  has_many :ngo_causes
  has_many :users, through: :user_causes
  has_many :ngos, through: :ngo_causes

  CAUSES = ["Tous les thèmes", "Environnement", "Jeunesse", "Cause animale", "Précarité", "Isolement", "Personnes âgées", "Santé", "Culture", "Sport"]

  validates :name, inclusion: { in: CAUSES, allow_nil: false }
end
