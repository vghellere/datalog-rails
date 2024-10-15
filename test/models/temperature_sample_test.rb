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
require "test_helper"

class TemperatureSampleTest < ActiveSupport::TestCase
  test "should not create sample with an invalid 'value'" do
    assert_raises ActiveRecord::RecordInvalid, match: "Validation failed: Value is not a number" do
      TemperatureSample.create!({ value: "string value", event_timestamp: DateTime.now })
    end

    assert_raises ActiveRecord::RecordInvalid, match: "Validation failed: Value is not a number" do
      TemperatureSample.create!({ value: true, event_timestamp: DateTime.now })
    end

    assert_raises ActiveRecord::RecordInvalid, match: "Validation failed: Value can't be blank, Value is not a number" do
      TemperatureSample.create!({ event_timestamp: DateTime.now })
    end

    assert_raises ActiveRecord::RecordInvalid, match: "Validation failed: Value can't be blank, Value is not a number" do
      TemperatureSample.create!({ value: nil, event_timestamp: DateTime.now })
    end
  end

  test "should not create a sample when missing event_timestamp" do
    assert_raises ActiveRecord::RecordInvalid, match: "Validation failed: Event timestamp can't be blank" do
      TemperatureSample.create!({ value: 24.5 })
    end
  end

  test "should successfully create a sample" do
    assert_difference "TemperatureSample.count", 1 do
      TemperatureSample.create!({ value: 24.5, event_timestamp: DateTime.now })
    end
  end
end
