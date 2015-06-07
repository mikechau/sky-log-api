class TravelLog < ActiveRecord::Base
  validates :key,
    :edit_key,
    presence: true,
    uniqueness: true

  def client_update!(secret:, params: {})
    if secret == edit_key
      update!(params)
    else
      fail TravelLogError::InvalidEditKey
    end
  end
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
#  edit_key   :string           not null
#
# Indexes
#
#  index_travel_logs_on_edit_key  (edit_key) UNIQUE
#  index_travel_logs_on_key       (key) UNIQUE
#
