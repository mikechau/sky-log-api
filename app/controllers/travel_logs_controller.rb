class TravelLogsController < ApplicationController

  def show
    travel_log = TravelLog.find_by!(key: params[:key])

    render json: TravelLogSerializer.json!(travel_log)
  end

  def create
    travel_log = TravelLog.create(
      key: params[:key],
      data: params[:data]
    )

    render json: ToJson::Serializer.json!(travel_log)
  end

  def update
    travel_log = TravelLog.find_by!(key: params[:key])

    travel_log.client_update!(
      secret: params[:secret],
      params: params[:data]
    )

    render json: TravelLogSerializer.json!(travel_log)
  end
end
