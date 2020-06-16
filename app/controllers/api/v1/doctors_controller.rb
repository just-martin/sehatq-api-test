class Api::V1::DoctorsController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_doctor, only: [:show]

  def index
    @doctors = Doctor.all
    render json: @doctors
  end

  def show
    render json: @doctor
  end

  private
    def find_doctor
      @doctor = Doctor.find_by(params[:id])
      if @doctor.nil?
        render json: {error: "Doctor Not Found"}, status: 404
      end
    end

    def doctor_params
      params.fetch(:doctor).permit(:name)
    end
end
