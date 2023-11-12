# frozen_string_literal: true

# Company is a class that represents a company with users
class Company
  attr_reader :id, :name, :top_up, :email_status

  def initialize(id:, name:, top_up:, email_status:)
    @id = id
    @name = name
    @top_up = top_up
    @email_status = email_status

    @users = []
  end

  def to_s
    "id: #{@id}, name: #{@name}, top_up: #{@top_up}, \
email_status: #{@email_status}, # users: #{@users.size}"
  end
end
