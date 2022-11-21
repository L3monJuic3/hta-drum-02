class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :host
  belong_to :lesson
end
