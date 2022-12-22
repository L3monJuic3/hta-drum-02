class RemoveLessonsFromBookings < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :lesson, foreign_key: true, index: false
  end
end
