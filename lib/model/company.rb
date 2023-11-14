# frozen_string_literal: true

require_relative 'user'

# Company is a class that represents a company with users
class Company
  # Potential bug in the take home assignment:
  #   - Jim Jimerson and Ned Nederson have the same id (33), for company id 3
  #   - The assignment does not specify whether or not duplicate users are
  #     allowed but hints at the possibility of bad data (e.g. duplicate users)
  #   - example_output.txt shows that duplicate users are allowed so I am not
  #     preventing duplicate users by default
  PREVENT_DUPLICATE_USERS = false

  attr_reader :id, :name, :top_up, :email_status,
              :users_to_email, :users_not_to_email

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

    if PREVENT_DUPLICATE_USERS && duplicate_user?(user)
      raise ArgumentError, "Company.add_user() received a User object \
with duplicate id #{user.id}"
    end

    users = users(user) # Determine which array to add the user to

    if block_given?
      users.insert(users.index(&) || -1, user)
    else
      users << user
    end
  end

  def add_user_sorted_by_name(user)
    add_user(user) do |u|
      if u.last_name == user.last_name
        u.first_name >= user.first_name
      else
        u.last_name >= user.last_name
      end
    end
  end

  def duplicate_user?(user)
    @users_to_email.any? { |u| u.id == user.id } ||
      @users_not_to_email.any? { |u| u.id == user.id }
  end

  def empty?
    user_count.zero?
  end

  def to_s
    "id: #{@id}, name: #{@name}, top_up: #{@top_up}, \
email_status: #{@email_status}, users to email: #{@users_to_email.size}, \
users not to email: #{@users_not_to_email.size}"
  end

  def user_count
    @users_to_email.size + @users_not_to_email.size
  end

  # Returns @users_to_email or @users_not_to_email depending on the email_status
  # of the company and the given user.
  def users(user)
    @email_status && user.email_status ? @users_to_email : @users_not_to_email
  end
end
