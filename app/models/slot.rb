class Slot < ApplicationRecord
  belongs_to :lesson
  belongs_to :booking
end
