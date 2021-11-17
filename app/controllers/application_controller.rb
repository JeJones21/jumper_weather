class ApplicationController < ActionController::API
  def unauthorized
    render json: {
      message: 'Credentials are incorrect',
      }, status: 401
  end

  def bad_request
    render json: {
      message: "bad request"
      }, status: 400
  end
end
