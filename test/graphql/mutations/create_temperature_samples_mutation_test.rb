require "test_helper"

class CreateTemperatureSamplesMutationTest < ActiveSupport::TestCase
  def create_mutation(temp_samples)
    temp_sample_inputs = temp_samples.map do |temp_sample|
      "{ value: #{temp_sample["value"]}, eventTimestamp: \"#{temp_sample["eventTimestamp"]}\" }"
    end

    <<-GQL
      mutation {
        createTemperatureSamples(temperatureSamples: [
          #{temp_sample_inputs.join(",")}
        ]) {
          value
          eventTimestamp
        }
      }
    GQL
  end

  test "should create and return one TemperatureSample" do
    temp_samples = [ { "value" => 22.1, "eventTimestamp" => "2024-10-16T19:50:00Z" } ]
    mutation = create_mutation(temp_samples)
    response_data = DatalogRailsSchema.execute(mutation)

    assert_equal response_data.to_h.dig("data", "createTemperatureSamples"), temp_samples
  end

  test "should create and return many TemperatureSamples" do
    temp_samples = [
      { "value" => 22.1, "eventTimestamp" => "2024-10-16T19:45:00Z" },
      { "value" => 25.4, "eventTimestamp" => "2024-10-16T19:50:00Z" },
      { "value" => 23.2, "eventTimestamp" => "2024-10-16T19:55:00Z" }
    ]
    mutation = create_mutation(temp_samples)
    response_data = DatalogRailsSchema.execute(mutation)

    assert_equal response_data.to_h.dig("data", "createTemperatureSamples"), temp_samples
  end
end
