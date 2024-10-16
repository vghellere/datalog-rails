module Types
  class CreateTemperatureSampleInput < Types::BaseInputObject
    description "Attributes for creating a TemperatureSample"
    argument :value, Float
    argument :event_timestamp, GraphQL::Types::ISO8601DateTime
  end
end
