class Lesson < ApplicationRecord
  has_many :slots, dependent: :destroy

  belongs_to :user

  validates user:, presence: true
end
