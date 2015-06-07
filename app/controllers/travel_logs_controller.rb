class TravelLogsController < ApplicationController

  def show
    travel_log = TravelLog.find_by!(key: params[:key])
    render json: ToJson::Serializer.json!(travel_log)
  end

  def create
    travel_log = TravelLog.create(create_travel_log_params)
    render json: ToJson::Serializer.json!(travel_log)
  end

  def update
    travel_log = TravelLog.find_by!(key: params[:key])
    travel_log.update!(update_travel_log_params)
    render json: ToJson::Serializer.json!(travel_log)
  end

  private

  def create_travel_log_params
    {
      key: params[:key],
      data: params[:data]
    }
  end

  def update_travel_log_params
    {
      data: params[:data]
    }
  end
end
