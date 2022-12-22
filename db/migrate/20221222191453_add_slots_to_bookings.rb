class AddSlotsToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :slots, foreign_key: true, index: false
  end
end
