class Cause < ApplicationRecord
  has_many :user_causes
  has_many :association_causes
  has_many :users, through: :user_causes
  has_many :associations, through: :association_causes

  CAUSES = ["Environnement", "Jeunesse", "Cause animale", "Précarité", "Isolement", "Personnes âgées", "Santé", "Culture", "Sport"]
  validates inclusion: { in: CAUSES, allow_nil: false }
end
