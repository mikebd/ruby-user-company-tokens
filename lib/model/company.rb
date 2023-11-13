# frozen_string_literal: true

# Company is a class that represents a company with users
class Company
  attr_reader :id, :name, :top_up, :email_status

  # rubocop:disable Layout/LineLength, Metrics/CyclomaticComplexity
  def initialize(id:, name:, top_up:, email_status:)
    raise ArgumentError, 'Company id must be an Integer' unless id.is_a?(Integer)
    raise ArgumentError, 'Company name must be a String' unless name.is_a?(String)
    raise ArgumentError, 'Company name must not be empty' if name.strip.empty?
    raise ArgumentError, 'Company top_up must be an Integer' unless top_up.is_a?(Integer)
    raise ArgumentError, 'Company top_up must be greater than or equal to 0' unless top_up >= 0
    raise ArgumentError, 'Company email_status must be a Boolean' unless email_status.is_a?(TrueClass) || email_status.is_a?(FalseClass)

    @id = id
    @name = name
    @top_up = top_up
    @email_status = email_status

    @users_to_email = []
    @users_not_to_email = []
  end
  # rubocop:enable Layout/LineLength, Metrics/CyclomaticComplexity

  # Add a user to the company.
  # If a block is passed to this method, use it to insert the user in sorted
  # order, otherwise, append the user to the end of the array.
  # e.g.: add_user(user) { |u| u.last_name >= user.last_name }
  def add_user(user, &)
    unless user.is_a?(User)
      raise ArgumentError, "Company.add_user() requires a User object, \
received #{user.class}"
    end

    if is_duplicate_user?(user)
      raise ArgumentError, "Company.add_user() received a User object \
with duplicate id #{user.id}"
    end

    users = if @email_status && user.email_status
              @users_to_email
            else
              @users_not_to_email
            end

    if block_given?
      users.insert(users.index(&) || -1, user)
    else
      users << user
    end
  end

  def add_user_sorted_by_last_name(user)
    add_user(user) { |u| u.last_name >= user.last_name }
  end

  def is_duplicate_user?(user)
    @users_to_email.any? { |u| u.id == user.id } ||
      @users_not_to_email.any? { |u| u.id == user.id }
  end

  def to_s
    "id: #{@id}, name: #{@name}, top_up: #{@top_up}, \
email_status: #{@email_status}, users to email: #{@users_to_email.size}, \
users not to email: #{@users_not_to_email.size}"
  end

  def user_count
    @users_to_email.size + @users_not_to_email.size
  end
end
