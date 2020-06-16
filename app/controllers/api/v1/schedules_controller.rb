class Api::V1::SchedulesController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_schedule, only: [:show, :update, :destroy]

  def index
    @schedules = Schedule.all
    render json: @schedules
  end

  def index_by_doctor
    date = params[:date] || Date.today.to_s
    day = date.to_date.strftime("%A")
    doctor = Doctor.find_by_id(params[:doctor_id])
    if doctor.nil?
      render json: {error: "Doctor Not Found"}, status: 404
    else
      @schedules = Schedule.where("doctor_id = #{doctor.id} and day = '#{day}'")
      render json: { date: date, doctor: doctor.to_api, 
                     schedules: @schedules.map{|s| s.doctor_schedule_to_api({date: date})}}
    end
  end

  def index_by_doctor_and_hospital
    date = params[:date] || Date.today.to_s
    day = date.to_date.strftime("%A")
    doctor = Doctor.find_by_id(params[:doctor_id])
    if doctor.nil?
      render json: {error: "Doctor Not Found"}, status: 404
      return
    end

    hospital = Hospital.find_by_id(params[:hospital_id])
    if hospital.nil?
      render json: {error: "Hospital Not Found"}, status: 404
      return
    end

    @schedules = Schedule.where("doctor_id = #{doctor.id} and hospital_id = #{hospital.id} and
                                 day = '#{day}'")
    render json: { date: date, doctor: doctor.to_api, 
                    schedules: @schedules.map{|s| s.doctor_schedule_to_api({date: date})}}

  end

  def show
    render json: @schedule
  end

  private
    def find_schedule
      @schedule = Schedule.find_by(params[:id])
      if @schedule.nil?
        render json: {error: "Schedule Not Found"}, status: 404
      end
    end

    def schedule_params
      params.fetch(:schedule).permit(:name)
    end
end
