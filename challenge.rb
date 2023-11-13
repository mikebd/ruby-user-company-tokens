# frozen_string_literal: true

require_relative 'lib/controller/companies_controller'

COMPANIES_JSON_FILE = 'companies.json'
USERS_JSON_FILE = 'users.json'
OUTPUT_FILE = 'output.txt'

# load the companies from the json files
companies = CompaniesController.load_json(
  COMPANIES_JSON_FILE,
  USERS_JSON_FILE
)

CompaniesController.write_top_ups(companies, OUTPUT_FILE)
