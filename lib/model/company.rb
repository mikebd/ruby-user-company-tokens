# frozen_string_literal: true

# Company is a class that represents a company with users
class Company
  attr_reader :id, :name, :top_up, :email_status

  # rubocop:disable Layout/LineLength
  def initialize(id:, name:, top_up:, email_status:)
    raise ArgumentError, 'Company id must be an Integer' unless id.is_a?(Integer)
    raise ArgumentError, 'Company name must be a String' unless name.is_a?(String)
    raise ArgumentError, 'Company top_up must be an Integer' unless top_up.is_a?(Integer)
    raise ArgumentError, 'Company email_status must be a Boolean' unless email_status.is_a?(TrueClass) || email_status.is_a?(FalseClass)

    # TODO: Additional validations to consider
    # - non-empty strings
    # - top_up >= 0

    @id = id
    @name = name
    @top_up = top_up
    @email_status = email_status

    @users = []
  end
  # rubocop:enable Layout/LineLength

  def to_s
    "id: #{@id}, name: #{@name}, top_up: #{@top_up}, \
email_status: #{@email_status}, # users: #{@users.size}"
  end
end
