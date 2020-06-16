class Schedule < ApplicationRecord
  has_many :bookings
  belongs_to :doctor
  belongs_to :hospital

  validates :operational_time, presence: true
  validates :day, presence: true
  validates :doctor_id, presence: true
  validates :hospital_id, presence: true

  def to_api
    return {
      operational_time: self.operational_time, 
      day: self.day,
      doctor: self.doctor.to_api,
      hospital: self.hospital.to_api,
    }
  end

  def doctor_schedule_to_api(params)
    return {
      operational_time: self.operational_time, 
      day: self.day,
      doctor: self.doctor.to_api,
      hospital: self.hospital.to_api,
      total_patient: self.get_bookings_by_date(params).size
    }
  end

  def get_bookings_by_date(params)
    date = params[:date]
    self.bookings.where("booking_date = '#{date}'")
  end
end
