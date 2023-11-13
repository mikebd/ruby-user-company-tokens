# frozen_string_literal: true

# CompaniesController is a stateless class that manages a set of Company objects
class CompaniesController
  def self.load_json(companies_filename, users_filename)
    companies = Companies.new

    load_companies_json(companies, companies_filename)
    load_users_json(companies, users_filename)

    companies
  end

  private_class_method def self.load_companies_json(companies, filename)
    file = File.read(filename)
    JSON.parse(file)

    # TODO: Add companies
  end

  private_class_method def self.load_users_json(companies, filename)
    file = File.read(filename)
    JSON.parse(file)

    # TODO: Add users to companies
  end
end
