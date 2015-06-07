class TravelLog < ActiveRecord::Base
  validates :key,
    presence: true,
    uniqueness: true
end

# == Schema Information
#
# Table name: travel_logs
#
#  id         :integer          not null, primary key
#  key        :string           not null
#  data       :jsonb            default({})
#  created_at :datetime
#  updated_at :datetime
#
# Indexes
#
#  index_travel_logs_on_key  (key) UNIQUE
#
