require 'rails_helper'

describe TravelLogsController, type: :controller do
  let(:travel_log) { create(:travel_log) }

  describe 'GET show' do
    context 'travel log key exists' do
      it 'returns a 200' do
        get :show, key: travel_log.key
        expect(response.status).to eq(200)
      end
    end

    context 'travel log key does not exist' do
      it 'returns a 404' do
        get :show, key: 'i-dont-really-exist'
        expect(response.status).to eq(404)
      end
    end
  end
end
