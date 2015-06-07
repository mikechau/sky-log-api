require 'rails_helper'

describe TravelLogSerializer, type: :serializer do
  let(:travel_log) { build(:travel_log) }

  it 'serializes a travel log with a key and data' do
    json = JSON.parse(TravelLogSerializer.json!(travel_log))
    expect(json.keys).to contain_exactly('key', 'data')
  end
end
