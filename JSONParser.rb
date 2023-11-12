# frozen_string_literal: true

require 'json'

class JSONParser
  def self.parse(json_string)
    JSON.parse(json_string, symbolize_names: true)
  end
end
