require 'rails_helper'

describe 'routes to the travel logs controller', :type => :routing do
  it 'routes show' do
    expect(get: travel_log_path(1)).
      to route_to(controller: 'travel_logs', action: 'show', key: '1', format: 'json')
  end

  it 'routes create' do
    expect(post: travel_logs_path).
      to route_to(controller: 'travel_logs', action: 'create', format: 'json')
  end

  it 'routes update' do
    expect(patch: travel_log_path(1)).
      to route_to(controller: 'travel_logs', action: 'update', format: 'json', key: '1')
  end
end
