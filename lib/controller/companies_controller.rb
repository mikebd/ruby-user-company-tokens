# frozen_string_literal: true

require 'json'

# CompaniesController is a stateless class that manages a set of Company objects
class CompaniesController
  def self.load_json(companies_filename, users_filename)
    companies = Companies.new

    begin
      # Companies must be loaded before users since users reference companies
      load_companies_json(companies, companies_filename)
      load_users_json(companies, users_filename)
    rescue => e
      warn "Error loading JSON files: #{e}"
    end

    companies
  end

  private_class_method def self.load_companies_json(companies, filename)
    file = File.read(filename)
    JSON.parse(file, symbolize_names: true).map do |json_company|
      companies.add(
        Company.new(
          id: json_company[:id],
          name: json_company[:name],
          top_up: json_company[:top_up],
          email_status: json_company[:email_status]
        )
      )
    rescue => e
      warn "Skipping user #{json_company[:id]} due to error: #{e}"
    end
  end

  private_class_method def self.load_users_json(companies, filename)
    file = File.read(filename)
    company = nil
    JSON.parse(file, symbolize_names: true).map do |json_user|
      # Ignore inactive users since they are not required for output.
      # This will reduce memory usage and improve performance which might be
      # noticeable for large data sets.
      next unless json_user[:active_status]

      begin
        if company.nil? || company.id != json_user[:company_id]
          # Avoid company lookup if the previous user was for the same company
          company = companies.company(json_user[:company_id])
        end

        add_user_to_company(company, json_user)
      rescue => e
        warn "Skipping user #{json_user[:id]} due to error: #{e}"
      end
    end
  end

  private_class_method def self.add_user_to_company(company, json_user)
    if company.nil?
      warn "Skipping user #{json_user[:id]} with unrecognized \
company id #{json_user[:company_id]}"
    else
      company.add_user(
        User.new(
          id: json_user[:id],
          first_name: json_user[:first_name],
          last_name: json_user[:last_name],
          email: json_user[:email],
          company_id: json_user[:company_id],
          email_status: json_user[:email_status],
          active_status: json_user[:active_status],
          tokens: json_user[:tokens]
        )
      )
    end
  end
end
