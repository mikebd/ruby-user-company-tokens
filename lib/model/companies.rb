# frozen_string_literal: true

# Companies is a class that manages a set of Company objects
class Companies
  def initialize
    @companies = []
  end

  def add(company)
    unless company.is_a?(Company)
      raise ArgumentError, "Companies.add() requires a Company object, \
received #{company.class}"
    end

    @companies << company
  end

  def size
    @companies.size
  end
end
