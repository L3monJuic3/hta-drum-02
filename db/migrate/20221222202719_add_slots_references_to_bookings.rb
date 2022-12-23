class AddSlotsReferencesToBookings < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :slots, null: false, foreign_key: true
  end
end
