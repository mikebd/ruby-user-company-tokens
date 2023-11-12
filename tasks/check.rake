# frozen_string_literal: true

# check task
task :check do
  Rake::Task[:rubocop].invoke
  Rake::Task[:test].invoke
end
