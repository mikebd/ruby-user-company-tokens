# frozen_string_literal: true

require 'rubocop/rake_task'

# rubocop task
RuboCop::RakeTask.new(:rubocop) do |task|
  task.fail_on_error = true
end
