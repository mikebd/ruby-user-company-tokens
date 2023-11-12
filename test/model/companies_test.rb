# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/model/companies'

class CompaniesTest < Minitest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_add_wrong_type
    companies = Companies.new
    assert_raises(ArgumentError) { companies.add(nil) }
    assert_raises(ArgumentError) { companies.add('not a company') }
    assert_raises(ArgumentError) { companies.add(0) }
    assert_equal(0, companies.size)
  end

  def test_add_company
    companies = Companies.new
    company = Company.new(id: 1, name: 'Company', top_up: 100,
                          email_status: true)
    companies.add(company)
    assert_equal(1, companies.size)
  end
end
