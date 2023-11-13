# frozen_string_literal: true

require 'forwardable'

require_relative 'company'

# Companies is a class that manages a set of Company objects
class Companies
  extend Forwardable

  def_delegators :@companies, :each, :empty?

  def initialize
    @companies = []
  end

  # Add a company to the set of companies.
  # If a block is passed to this method, use it to insert the company in sorted
  # order, otherwise, append the company to the end of the array.
  # e.g.: add(company) { |c| c.id >= company.id }
  def add(company, &)
    unless company.is_a?(Company)
      raise ArgumentError, "Companies.add() requires a Company object, \
received #{company.class}"
    end

    if @companies.any? { |c| c.id == company.id }
      raise ArgumentError, "Companies.add() received a Company object \
with duplicate id #{company.id}"
    end

    if block_given?
      @companies.insert(@companies.index(&) || -1, company)
    else
      @companies << company
    end
  end

  def add_sorted_by_id(company)
    add(company) { |c| c.id >= company.id }
  end

  def company(id)
    @companies.bsearch { |c| c.id >= id }
  end

  def company_count
    @companies.size
  end
end
