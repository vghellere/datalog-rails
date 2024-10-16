
module Types
  class QueryType < Types::BaseObject
    field :temperature_samples, [ TemperatureSampleType ], null: false,
    description: "Return a list of the latest 'n_samples' of TemperatureSample" do
      argument :n_samples, Integer, default_value: 300, validates: { numericality: { within: 1..1000 } }
    end

    def temperature_samples(n_samples:)
      TemperatureSample.order(event_timestamp: :desc).limit(n_samples).all.reverse
    end
  end
end
