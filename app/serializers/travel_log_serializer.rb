class TravelLogSerializer < ::ToJson::Serializer
  def serialize(travel_log)
    put_fields travel_log, :key, :data
  end
end
