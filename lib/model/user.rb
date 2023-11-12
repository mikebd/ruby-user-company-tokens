# frozen_string_literal: true

# User is a class that represents a user
class User
  attr_reader :id, :first_name, :last_name, :email, :company_id, :email_status,
              :active_status, :tokens

  # rubocop:disable Layout/LineLength, Metrics/*
  def initialize(id:, first_name:, last_name:, email:, company_id:,
                 email_status:, active_status:, tokens:)
    raise ArgumentError, 'User id must be an Integer' unless id.is_a?(Integer)
    raise ArgumentError, 'User first_name must be a String' unless first_name.is_a?(String)
    raise ArgumentError, 'User last_name must be a String' unless last_name.is_a?(String)
    raise ArgumentError, 'User email must be a String' unless email.is_a?(String)
    raise ArgumentError, 'User company_id must be an Integer' unless company_id.is_a?(Integer)
    raise ArgumentError, 'User email_status must be a Boolean' unless email_status.is_a?(TrueClass) || email_status.is_a?(FalseClass)
    raise ArgumentError, 'User active_status must be a Boolean' unless active_status.is_a?(TrueClass) || active_status.is_a?(FalseClass)
    raise ArgumentError, 'User tokens must be an Integer' unless tokens.is_a?(Integer)

    # TODO: Additional validations to consider
    # - non-empty strings
    # - email format

    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @company_id = company_id
    @email_status = email_status
    @active_status = active_status
    @tokens = tokens
  end
  # rubocop:enable Layout/LineLength, Metrics/*

  def to_s
    "id: #{@id}, first_name: #{@first_name}, last_name: #{@last_name}, \
email: #{@email}, company_id: #{@company_id}, \
email_status: #{@email_status}, active_status: #{@active_status}, \
tokens: #{@tokens}"
  end
end
