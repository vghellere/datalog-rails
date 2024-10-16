# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_temperature_samples, mutation: Mutations::CreateTemperatureSamples
  end
end
