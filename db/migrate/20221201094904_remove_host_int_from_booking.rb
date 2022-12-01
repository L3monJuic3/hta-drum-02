class RemoveHostIntFromBooking < ActiveRecord::Migration[7.0]
  def change
    remove_column :bookings, :host_id, :bgint
  end
end
