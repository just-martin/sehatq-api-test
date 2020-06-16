class Api::V1::BookingsController < Api::V1::ApplicationController
  before_action :admin?, only: [:index]
  before_action :find_booking, only: [:show, :update, :destroy]

  def index
    @active_bookings = Booking.get_active_bookings
    @expired_bookings = Booking.get_expired_bookings
    render json: {active_bookings: @active_bookings, expired_bookings: @expired_bookings}
  end

  def index_by_user
    @active_bookings = current_user.get_active_bookings
    @expired_bookings = current_user.get_expired_bookings
    render json: {active_bookings: @active_bookings, expired_bookings: @expired_bookings}
  end

  def show
    render json: @booking
  end

  def create
    if params[:hospital_id].nil?
      render json: {error: "Hospital cannot be blank"}, status: 404
    elsif params[:booking][:booking_date].nil?
      render json: {error: "Booking date cannot be blank"}, status: 404
    elsif params[:booking][:schedule_id].nil?
      render json: {error: "Schedule cannot be blank"}, status: 404
    end
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      render json: @booking, status: 200
    else
      render json: @booking.errors, status: 400
    end
  end

  def update
    if @booking.update(booking_params)
      render json: @booking
    else
      render json: @booking.errors, status: 400
    end
  end

  def destroy
    if @booking.destroy
      render json: {message: "Booking successfully deleted"}, status: 200
    else
      render json: @booking.errors, status: 400
    end
  end

  def get_booking_by_patients
    current_user.get_registered_booking
    render json: current_user.get_registered_booking, status: 200
  end

  def make_appointment
    if params[:booking][:operational_time].nil?
      render json: {error: "Operatioanl Time cannot be blank"}, status: 404
    elsif params[:booking][:day].nil?
      render json: {error: "Day cannot be blank"}, status: 404
    elsif params[:booking][:doctor_id].nil?
      render json: {error: "Doctor cannot be blank"}, status: 404
    elsif params[:booking][:hospital_id].nil?
      render json: {error: "Hospital cannot be blank"}, status: 404
    end
  end

  private
    def find_booking
      @booking = Booking.find_by(params[:id])
      if @booking.nil?
        render json: {error: "Booking Not Found"}, status: 404
      end
    end

    def booking_params
      params.fetch(:booking).permit(:booking_date, :schedule_id)
    end
end
