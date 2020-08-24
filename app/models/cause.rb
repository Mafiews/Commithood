class Cause < ApplicationRecord
  has_many :user_causes
  has_many :association_causes
  has_many :users, through: :user_causes
  has_many :associations, through: :association_causes
end
