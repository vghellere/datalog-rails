# frozen_string_literal: true

class DatalogRailsSchema < GraphQL::Schema
  mutation(Types::MutationType)
  query(Types::QueryType)

  # Limit the size of incoming queries:
  max_query_string_tokens(5000)

  # Stop validating when it encounters this many errors:
  validate_max_errors(100)
end
