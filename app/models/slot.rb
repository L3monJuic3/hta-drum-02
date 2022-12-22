class Slot < ApplicationRecord
  belongs_to :lesson

  validates :start_time, presence: true
  validates :end_time, presence: true

  scope :available, -> { where(is_available: true) }

  # I don't know what this is for yet but it looks important from similar code
  def slot_time
    "#{self.start_time.strftime("%R")} - #{self.end_time.strftime("%R")}"
  end
end
