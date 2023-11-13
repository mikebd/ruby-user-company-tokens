# frozen_string_literal: true

require 'stringio'

require_relative '../model/company'

# CompanyView is a stateless class that renders Company objects
class CompanyView
  def self.render_top_ups(company)
    result = StringIO.new
    total_top_ups = 0

    # rubocop:disable Layout/LineLength
    result << "\tCompany Id: #{company.id}\n"
    result << "\tCompany Name: #{company.name}\n"
    result << "\tUsers Emailed:\n"
    total_top_ups += add_users_top_ups(result, company.top_up, company.users_to_email)
    result << "\tUsers Not Emailed:\n"
    total_top_ups += add_users_top_ups(result, company.top_up, company.users_not_to_email)
    result << "\t\tTotal amount of top ups for #{company.name}: #{total_top_ups}\n"
    # rubocop:enable Layout/LineLength

    result.string
  end

  private_class_method def self.add_users_top_ups(output, top_up, users)
    users.each do |user|
      output << "\t\t#{user.last_name}, #{user.first_name}, #{user.email}\n"
      output << "\t\t  Previous Token Balance, #{user.tokens}\n"
      output << "\t\t  New Token Balance #{user.tokens + top_up}\n"
    end

    users.length * top_up
  end
end
