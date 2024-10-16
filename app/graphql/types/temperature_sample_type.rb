# frozen_string_literal: true

module Types
  class TemperatureSampleType < Types::BaseObject
    field :id, ID, null: false
    field :value, Float, null: false
    field :event_timestamp, GraphQL::Types::ISO8601DateTime, null: false
  end
end
