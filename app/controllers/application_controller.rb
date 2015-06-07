class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token

  rescue_from ActiveRecord::RecordNotFound, with: :record_missing
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  protected

  def record_missing
    render json: { error: 'Travel Log not found!', status: 404 }, status: 404
  end

  def record_invalid
    render json: { error: 'Travel Log validation failed!' }, status: 506
  end
end
