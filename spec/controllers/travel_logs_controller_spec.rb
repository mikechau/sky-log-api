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

  describe 'POST create' do
    context 'with valid params' do
      it 'returns a 200' do
        post :create, key: 'log2', secret: 'log2-edit', data: {}
        expect(response.status).to eq(200)
      end

      it 'creates a travel log' do
        expect {
          post :create, key: 'log2', secret: 'log2-edit', data: {}
        }.to change(TravelLog, :count).by(1)
      end
    end

    context 'with invalid params' do
      it 'returns a 506' do
        post :create, key: '', secret: '', data: {}
        expect(response.status).to eq(506)
      end
    end
  end

  describe 'PUT update' do
    context 'with valid params' do
      it 'returns a 200' do
        put :update, key: travel_log.key, secret: travel_log.edit_key, data: {}
        expect(response.status).to eq(200)
      end

      it 'updates a travel log' do
        put :update, key: travel_log.key, secret: travel_log.edit_key, data: { test: 'test' }

        travel_log.reload

        json = JSON.parse(response.body)

        expect(travel_log.data).not_to eq({})
        expect(json['data']).to eq(travel_log.data)
      end
    end

    context 'with invalid params' do
      it 'returns a 401' do
        put :update, key: travel_log.key, secret: 'bad-secret', data: { test: 'test2' }

        expect(response.status).to eq(401)
      end

      it 'does not update the travel log' do
        invalid_data = { test: 'testing' }

        put :update, key: travel_log.key, secret: travel_log.edit_key, data: invalid_data

        travel_log.reload

        expect(travel_log.data).not_to eq(invalid_data)
      end
    end
  end
end
