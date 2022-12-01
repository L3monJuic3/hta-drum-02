class RemoveHostIndexFromBooking < ActiveRecord::Migration[7.0]
  def change
    remove_index :booking, name: "index_bookings_on_host_id"
  end
end
