class RemoveSlotIdFromBooking < ActiveRecord::Migration[7.0]
  def change
    remove_reference :bookings, :slots, foreign_key: true, index: false
  end
end
