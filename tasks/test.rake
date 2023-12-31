# frozen_string_literal: true

require 'minitest/test_task'

# test task
Minitest::TestTask.create(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'
  t.warning = true
  t.test_globs = ['test/**/*_test.rb']
end
