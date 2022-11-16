class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime :booking_date
      t.boolean :is_cancelled
      t.references :user, null: false, foreign_key: true
      t.references :host, null: false, foreign_key: true

      t.timestamps
    end
  end
end
