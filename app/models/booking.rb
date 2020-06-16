class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :schedule

  validates :booking_date, presence: true
  validates :user_id, presence: true
  validates :schedule_id, presence: true
  validate :booking_time
  validate :get_queue_number

  def to_api
    return { booking_date: self.booking_date,
             queue: self.queue,
             schedule: self.schedule.to_api }
  end

  def self.get_active_bookings
    date = Time.now.strftime("%F")
    time = Time.now.strftime("%T")
    @bookings = Booking.joins(:schedule).
                        where("(bookings.booking_date > '#{date}') or 
                               (bookings.booking_date = '#{date}' and schedules.operational_time > '#{time}') ")

    return @bookings.map(&:to_api)
  end

  def self.get_expired_bookings
    date = Time.now.strftime("%F")
    time = Time.now.strftime("%T")
    @bookings = Booking.joins(:schedule).
                        where("(bookings.booking_date < '#{date}') or 
                               (bookings.booking_date = '#{date}' and schedules.operational_time < '#{time}') ")

    return @bookings.map(&:to_api)

  end

  private

    def booking_time
      date_today = Date.today
      return if self.booking_date.to_date > date_today
      if self.booking_date.to_date == date_today
        time_now = Time.now
        schedule = Schedule.find_by_id(self.schedule_id)
        min = (schedule.operational_time.to_time - time_now)/60
        return if min.to_i >= 30
        self.errors.add(:booking_date, "Booking time is invalid (already passed)")
      else
        self.errors.add(:booking_date, "Booking date is invalid (already passed)")
      end
    end

    def get_queue_number
      bookings = Booking.where("booking_date = '#{self.booking_date}' and
                                schedule_id = #{self.schedule_id}")

      if bookings.size >= 10
        self.errors.add(:queue, "Booking date for #{self.booking_date} already already full book")
      else
        self.queue = bookings.size + 1
      end
    end
end
