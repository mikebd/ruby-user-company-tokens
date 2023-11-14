# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/model/company'

class CompanyTest < Minitest::Test
  def setup
    @company1 = Company.new(id: 1, name: 'Company One', top_up: 100,
                            email_status: true)

    @user1 = User.new(id: 1, first_name: 'Alice1', last_name: 'Smith1',
                      email: 'alice1.smith1@company', company_id: 1,
                      email_status: true, active_status: false, tokens: 10)
    @user2 = User.new(id: 2, first_name: 'Alice2', last_name: 'Smith2',
                      email: 'alice2.smith2@company', company_id: 1,
                      email_status: true, active_status: false, tokens: 10)
    @user3 = User.new(id: 3, first_name: 'Alice3', last_name: 'Smith3',
                      email: 'alice3.smith3@company', company_id: 1,
                      email_status: true, active_status: false, tokens: 10)
    @user4 = User.new(id: 4, first_name: 'Alice4', last_name: 'Smith4',
                      email: 'alice4.smith4@company', company_id: 1,
                      email_status: true, active_status: false, tokens: 10)
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
    @company1.add_user(@user1)

    assert_equal(1, @company1.user_count)

    if Company::PREVENT_DUPLICATE_USERS
      assert_raises(ArgumentError) { @company1.add_user(@user1) }
      assert_equal(1, @company1.user_count)
    end

    @company1.add_user(@user2)

    assert_equal(2, @company1.user_count)
  end

  def test_add_user_sorted_by_last_name
    @company1.add_user_sorted_by_name(@user3)
    @company1.add_user_sorted_by_name(@user4)
    @company1.add_user_sorted_by_name(@user1)
    @company1.add_user_sorted_by_name(@user2)

    assert_equal(4, @company1.user_count)
    assert_equal(@user1, @company1.instance_variable_get(:@users_to_email)[0])
    assert_equal(@user2, @company1.instance_variable_get(:@users_to_email)[1])
    assert_equal(@user3, @company1.instance_variable_get(:@users_to_email)[2])
    assert_equal(@user4, @company1.instance_variable_get(:@users_to_email)[3])
  end

  def test_to_s
    assert_equal("id: 1, name: Company One, top_up: 100, email_status: true, \
users to email: 0, users not to email: 0",
                 @company1.to_s)
  end
end
