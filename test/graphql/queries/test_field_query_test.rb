require "test_helper"

class TestFieldQueryTest < ActiveSupport::TestCase
  def setup
    @query = <<-GQL
      query {
        testField
      }
    GQL
  end

  test "should return 'Hello World!'" do
    assert_equal DatalogRailsSchema.execute(@query).to_h.dig("data", "testField"), "Hello World!"
  end
end
