class AddLessonIdToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :lesson, null: false, foreign_key: true
  end
end
