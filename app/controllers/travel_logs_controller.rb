class TravelLogsController < ApplicationController
  rescue_from TravelLogError::InvalidEditKey, with: :record_invalid_secret

  before_action :set_travel_log, only: [:show, :update]
  before_action :check_secret, only: :update

  def show
    render json: TravelLogSerializer.json!(@travel_log)
  end

  def create
    @travel_log = TravelLog.create!(
      key: params[:key],
      edit_key: params[:secret],
      data: params[:data]
    )

    render json: TravelLogSerializer.json!(@travel_log)
  end

  def update
    @travel_log.update!(data: params[:data])

    render json: TravelLogSerializer.json!(@travel_log)
  end

  protected

  def record_invalid_secret
    render json: { error: 'Secret is invalid.' }, status: 401
  end

  private

  def set_travel_log
    @travel_log = TravelLog.find_by!(key: params[:key])
  end

  def check_secret
    fail TravelLogError::InvalidEditKey unless valid_secret?
  end

  def valid_secret?
    params[:secret] == @travel_log.edit_key
  end
end
