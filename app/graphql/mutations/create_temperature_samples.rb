module Mutations
  class CreateTemperatureSamples < Mutations::BaseMutation
    argument :temperature_samples, [ Types::CreateTemperatureSampleInput ], required: true

    type [ Types::TemperatureSampleType ]

    def resolve(temperature_samples:)
      response_data = []

      temperature_samples.each do |temperature_sample|
        new_temp_sample = TemperatureSample.new({
          value: temperature_sample.value,
          event_timestamp: temperature_sample.event_timestamp
        })

        # we're not gonna handle the case where any of the samples could not be created
        # for now we'll just discard it
        response_data << new_temp_sample if new_temp_sample.save
      end

      response_data
    end
  end
end
