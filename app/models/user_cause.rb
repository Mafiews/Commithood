class UserCause < ApplicationRecord
  belongs_to :user
  belongs_to :cause
end
