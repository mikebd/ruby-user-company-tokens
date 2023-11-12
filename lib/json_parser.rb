# frozen_string_literal: true

require 'json'

# JSONParser is a class that parses JSON strings
class JSONParser
  def self.parse(json_string)
    JSON.parse(json_string, symbolize_names: true)
  end
end
