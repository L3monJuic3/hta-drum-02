class RemoveBookingIdFromSlotsTable < ActiveRecord::Migration[7.0]
  def change
    remove_reference :slots, :booking, foreign_key: true, index: false
  end
end
