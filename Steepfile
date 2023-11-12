# frozen_string_literal: true

Diag = Steep::Diagnostic

target :lib do
  signature 'sig'

  check 'lib' # Directory name
  check 'Gemfile' # File name
  #   check "app/models/**/*.rb"        # Glob
  #   # ignore "lib/templates/*.rb"
  #
  #   # library "pathname", "set"       # Standard libraries
  #   # library "strong_json"           # Gems

  library 'set', 'pathname'

  # rubocop:disable Layout/LineLength
  configure_code_diagnostics(Diag::Ruby.strict) # `strict` diagnostics setting
  #   # configure_code_diagnostics(Diag::Ruby.lenient)      # `lenient` diagnostics setting
  #   # configure_code_diagnostics do |hash|             # You can setup everything yourself
  #   #   hash[Diag::Ruby::NoMethod] = :information
  #   # end
  # rubocop:enable Layout/LineLength
end
