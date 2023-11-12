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

    @companies.each do |c|
      if c.id == company.id
        raise ArgumentError, "Companies.add() received a Company object \
with duplicate id #{company.id}"
      end
    end

    @companies << company
  end

  def company_count
    @companies.size
  end
end
