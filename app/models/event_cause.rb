class EventCause < ApplicationRecord
  belongs_to :cause
  belongs_to :event
end
