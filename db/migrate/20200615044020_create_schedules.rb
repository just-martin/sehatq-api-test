class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.time    :operational_time
      t.string  :day
      t.integer :doctor_id
      t.integer :hospital_id
      t.timestamps
    end
  end
end
