require "test_helper"

class TemperatureSamplesQueryTest < ActiveSupport::TestCase
  def setup
    @temperature_sample_1 = temperature_samples(:temperature_sample_1)
    @temperature_sample_2 = temperature_samples(:temperature_sample_2)
    @temperature_sample_3 = temperature_samples(:temperature_sample_3)
    @temperature_sample_4 = temperature_samples(:temperature_sample_4)
    @temperature_sample_5 = temperature_samples(:temperature_sample_5)
  end

  def create_query(n_samples)
    <<-GQL
      query {
        temperatureSamples(nSamples: #{n_samples}) {
          id
          value
          eventTimestamp
        }
      }
    GQL
  end

  def create_expected_data(temp_samples)
    temp_samples.map do |temp_sample|
      { "id" => temp_sample.id.to_s, "value" => temp_sample.value, "eventTimestamp" => temp_sample.event_timestamp.iso8601 }
    end
  end

  test "should return list of the latest 5 TemperatureSamples in the right order" do
    expected_data = create_expected_data([
      @temperature_sample_1, @temperature_sample_2, @temperature_sample_3,
      @temperature_sample_4, @temperature_sample_5
    ])
    query = create_query(5)
    response_data = DatalogRailsSchema.execute(query).to_h.dig("data", "temperatureSamples")

    assert_equal response_data, expected_data
  end

  test "should return list of the latest 2 TemperatureSamples in the right order" do
    expected_data = create_expected_data([
      @temperature_sample_4, @temperature_sample_5
    ])
    query = create_query(2)
    response_data = DatalogRailsSchema.execute(query).to_h.dig("data", "temperatureSamples")

    assert_equal response_data, expected_data
  end
end
