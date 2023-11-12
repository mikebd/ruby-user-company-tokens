# frozen_string_literal: true

desc 'Type check the code'
task :typecheck do
  sh 'bundle exec steep check'
end
