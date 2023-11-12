# frozen_string_literal: true

require 'minitest/autorun'
require_relative 'JSONParser'

class TestJSONParser < Minitest::Test
  def test_parse_valid_json
    json_string = '{"name": "Alice", "age": 30}'
    parsed_data = JSONParser.parse(json_string)
    assert_equal({ name: 'Alice', age: 30 }, parsed_data)
  end

  def test_parse_invalid_json
    json_string = '{invalid_json}'
    assert_raises(JSON::ParserError) { JSONParser.parse(json_string) }
  end
end
