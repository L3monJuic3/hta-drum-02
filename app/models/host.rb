class Host < ApplicationRecord
  has_many :bookings
  has_many :lessons
end
