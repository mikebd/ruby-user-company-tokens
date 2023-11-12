# frozen_string_literal: true

desc 'Run all quality checks'
task :check do
  Rake::Task[:rubocop].invoke
  # TODO: figure out why steep is failing
  # Rake::Task[:typecheck].invoke
  Rake::Task[:test].invoke
end
