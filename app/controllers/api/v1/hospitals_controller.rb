class Api::V1::HospitalsController < Api::V1::ApplicationController
  skip_before_action :authenticate_user!
  before_action :find_hospital, only: [:show]

  def index
    @hospitals = Hospital.all
    render json: @hospitals
  end

  def show
    render json: @hospital
  end

  private
    def find_hospital
      @hospital = Hospital.find_by(params[:id])
      if @hospital.nil?
        render json: {error: "Hospital Not Found"}, status: 404
      end
    end

    def hospital_params
      params.fetch(:hospital).permit(:name)
    end
end
