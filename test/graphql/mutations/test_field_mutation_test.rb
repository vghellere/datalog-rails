require "test_helper"

class TestFieldMutationTest < ActiveSupport::TestCase
  def setup
    @query = <<-GQL
      mutation {
        testField
      }
    GQL
  end

  test "should return 'Hello World!'" do
    assert_equal DatalogRailsSchema.execute(@query).to_h.dig("data", "testField"), "Mutation successful"
  end
end
