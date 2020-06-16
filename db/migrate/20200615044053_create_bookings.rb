class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date      :booking_date
      t.integer   :queue
      t.integer   :user_id
      t.integer   :schedule_id
      t.timestamps
    end
  end
end
