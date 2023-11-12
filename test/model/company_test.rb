# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/model/company'

class CompanyTest < Minitest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_to_s
    company = Company.new(id: 1, name: 'Company', top_up: 100,
                          email_status: true)
    assert_equal("id: 1, name: Company, top_up: 100, email_status: true, \
# users: 0",
                 company.to_s)
  end
end
