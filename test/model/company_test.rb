# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/model/company'

class CompanyTest < Minitest::Test
  def setup
    @company1 = Company.new(id: 1, name: 'Company One', top_up: 100,
                            email_status: true)
  end

  def teardown
    # Do nothing
  end

  def test_add_user_wrong_type
    assert_raises(ArgumentError) { @company1.add_user(nil) }
    assert_raises(ArgumentError) { @company1.add_user('not a user') }
    assert_raises(ArgumentError) { @company1.add_user(0) }
    assert_equal(0, @company1.user_count)
  end

  def test_add_user
    user_one = User.new(id: 1, first_name: 'Alice', last_name: 'Smith',
                        email: 'alice.smith@company', company_id: 1,
                        email_status: true, active_status: false, tokens: 10)
    @company1.add_user(user_one)

    assert_equal(1, @company1.user_count)

    assert_raises(ArgumentError) { @company1.add_user(user_one) }
    assert_equal(1, @company1.user_count)

    user_two = User.new(id: 2, first_name: 'Alice2', last_name: 'Smith2',
                        email: 'alice2.smith2@company', company_id: 1,
                        email_status: true, active_status: false, tokens: 10)
    @company1.add_user(user_two)

    assert_equal(2, @company1.user_count)
  end

  def test_to_s
    assert_equal("id: 1, name: Company One, top_up: 100, email_status: true, \
users to email: 0, users not to email: 0",
                 @company1.to_s)
  end
end
