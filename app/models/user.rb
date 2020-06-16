# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :bookings

  def get_active_bookings
    date = Time.now.strftime("%F")
    time = Time.now.strftime("%T")
    @bookings = Booking.joins(:schedule).
                        where("bookings.user_id = #{self.id} and ((bookings.booking_date > '#{date}') or 
                              (bookings.booking_date = '#{date}' and schedules.operational_time > '#{time}')) ")

    return @bookings.map(&:to_api)
  end

  def get_expired_bookings
    date = Time.now.strftime("%F")
    time = Time.now.strftime("%T")
    @bookings = Booking.joins(:schedule).
                        where("bookings.user_id = #{self.id} and ((bookings.booking_date < '#{date}') or
                               (bookings.booking_date = '#{date}' and schedules.operational_time < '#{time}')) ")

    return @bookings.map(&:to_api)
  end

end
