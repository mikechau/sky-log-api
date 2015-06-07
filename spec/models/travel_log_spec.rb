require 'rails_helper'

describe TravelLog, type: :model do
  let(:new_travel_log) { TravelLog.new }
  let(:travel_log) { build(:travel_log) }

  context 'a invalid travel log' do
    it 'is initialized' do
      expect(new_travel_log.invalid?).to be_truthy
    end

    it 'has error messages' do
      new_travel_log.valid?
      expect(new_travel_log.errors.keys).to contain_exactly(:key, :edit_key)
    end
  end

  context 'a valid travel log' do
    it 'is initialized' do
      expect(travel_log.valid?).to be_truthy
    end
  end
end
