class Lesson < ApplicationRecord
  belongs_to :host
  has_many :bookings
end
