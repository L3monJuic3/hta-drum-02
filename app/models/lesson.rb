class Lesson < ApplicationRecord
  has_many :slots, dependent: :destroy

  belongs_to :user
  has_one_attached :image
  # validates user:, presence: true
end
