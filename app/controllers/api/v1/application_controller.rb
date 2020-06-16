class Api::V1::ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_user!

  def admin?
    unless  current_user.email == "admin@kiranatama.com"
      render json: {message: "Not Permitted"}, status: 404
    end
  end
end
