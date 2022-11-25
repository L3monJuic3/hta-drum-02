class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :host
  belongs_to :lesson

  scope :ordered, -> { order(booking: :asc) }
end
