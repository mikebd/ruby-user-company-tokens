# frozen_string_literal: true

# User is a class that represents a user
class User
  attr_reader :id, :first_name, :last_name, :email, :company_id, :email_status,
              :active_status, :tokens

  # rubocop:disable Metrics/ParameterLists
  def initialize(id:, first_name:, last_name:, email:, company_id:,
                 email_status:, active_status:, tokens:)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @company_id = company_id
    @email_status = email_status
    @active_status = active_status
    @tokens = tokens
  end

  # rubocop:enable Metrics/ParameterLists

  def to_s
    "id: #{@id}, first_name: #{@first_name}, last_name: #{@last_name}, \
email: #{@email}, company_id: #{@company_id}, \
email_status: #{@email_status}, active_status: #{@active_status}, \
tokens: #{@tokens}"
  end
end
