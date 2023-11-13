# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/model/companies'

class CompaniesTest < Minitest::Test
  def setup
    @companies = Companies.new
    @company1 = Company.new(id: 1, name: 'Company One', top_up: 100,
                            email_status: true)
    @company2 = Company.new(id: 2, name: 'Company Two', top_up: 200,
                            email_status: true)
    @company3 = Company.new(id: 3, name: 'Company Three', top_up: 300,
                            email_status: true)
    @company4 = Company.new(id: 4, name: 'Company Four', top_up: 400,
                            email_status: true)
  end

  def teardown
    # Do nothing
  end

  def test_add_wrong_type
    assert_raises(ArgumentError) { @companies.add(nil) }
    assert_raises(ArgumentError) { @companies.add('not a company') }
    assert_raises(ArgumentError) { @companies.add(0) }
    assert_equal(0, @companies.company_count)
  end

  def test_add_company
    @companies.add(@company1)

    # Duplicate company id should fail to add
    assert_raises(ArgumentError) { @companies.add(@company1) }
    assert_equal(1, @companies.company_count)

    @companies.add(@company2)

    assert_equal(2, @companies.company_count)
  end

  def test_add_sorted_by_id
    @companies.add_sorted_by_id(@company3)
    @companies.add_sorted_by_id(@company4)
    @companies.add_sorted_by_id(@company1)
    @companies.add_sorted_by_id(@company2)

    assert_equal(4, @companies.company_count)
    assert_equal(@company1, @companies.instance_variable_get(:@companies)[0])
    assert_equal(@company2, @companies.instance_variable_get(:@companies)[1])
    assert_equal(@company3, @companies.instance_variable_get(:@companies)[2])
    assert_equal(@company4, @companies.instance_variable_get(:@companies)[3])
  end
end
