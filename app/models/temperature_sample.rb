# == Schema Information
#
# Table name: temperature_samples
#
#  id              :integer          not null, primary key
#  value           :float
#  event_timestamp :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class TemperatureSample < ApplicationRecord
  validates :value, :event_timestamp, presence: true
  validates :value, numericality: true
end
