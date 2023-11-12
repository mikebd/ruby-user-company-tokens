# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/model/user'

class UserTest < Minitest::Test
  def setup
    # Do nothing
  end

  def teardown
    # Do nothing
  end

  def test_to_s
    user = User.new(id: 1, first_name: 'Alice', last_name: 'Smith',
                    email: 'alice.smith@company', company_id: 1,
                    email_status: 'valid', active_status: 'active', tokens: 10)
    assert_equal("id: 1, first_name: Alice, last_name: Smith, \
email: alice.smith@company, company_id: 1, email_status: valid, \
active_status: active, tokens: 10", user.to_s)
  end
end
