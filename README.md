# ruby-user-company-tokens

A coding challenge to compute token top ups for company users.

The contents of this readme are geared towards explaining my approach to this
coding challenge. They do not reflect the readme contents I would provide in a
production repository.

## Table of Contents

* [Bootstrap of this repository](#bootstrap-of-this-repository)
* [Development Environment](#development-environment)
  * [Local Development](#local-development)
  * [Initial Testing of the Bootstrap](#initial-testing-of-the-bootstrap)

## Bootstrap of this repository

This repository was created using the following steps:

1. In GitHub, create a new public repository with a readme, .gitignore for Ruby
   and MIT license

2. In [Bing Chat](https://www.microsoft.com/en-us/edge/features/bing-chat) enter
   the following prompt:

> As an expert Ruby developer, create a code base that is capable of parsing
> JSON and running XUnit style unit tests. It should use rubocop to validate
> code
> style according to community idiomatic guidelines and have a compatible
> editorconfig that works well with jetbrains rubymine. It should also have a
> dockerfile that allows this program to work well with a minimal ruby 3.2 base
> image.

3. Review the result and incrementally improve it with additional prompts

> Let's limit line length to 80 and method non-comment line count to 20

> Please add the line length limit to editorconfig as well, and suggest
> .gitignore additions for jetbrains rubymine

> rubocop should also ensure that every file ends with a newline

4. Copy the resulting code snippets from Bing Chat into the editor

## Development Environment

This project was developed
using [JetBrains RubyMine](https://www.jetbrains.com/ruby/)
with
the [GitHub Copilot](https://plugins.jetbrains.com/plugin/17718-github-copilot)
plugin installed.

### Local Development

* `rake check` # Runs rubocop and minitest<br/>
  ```
  ❯ rake check
  Running RuboCop...
  Inspecting 16 files
  ................

  16 files inspected, no offenses detected
  Run options: --seed 52768

  # Running:

  ........

  Finished in 0.001314s, 6088.2800 runs/s, 19025.8751 assertions/s.

  8 runs, 25 assertions, 0 failures, 0 errors, 0 skips
  ```

* Final manual end to end testing was done with:<br/>
  ```
  ruby challenge.rb && bcomp output.txt example_output.txt
  ```
  Where `bcomp` is provided
  by [Beyond Compare](https://www.scootersoftware.com/home).
  `diff` can be used instead.

#### All Rake Tasks

```
❯ rake --tasks
rake check                    # Run all quality checks
rake default                  # Run the default task(s)
rake rubocop                  # Run RuboCop
rake rubocop:autocorrect      # Autocorrect RuboCop offenses (only when it's safe)
rake rubocop:autocorrect_all  # Autocorrect RuboCop offenses (safe and unsafe)
rake test                     # Run the test suite
rake test:cmd                 # Print out the test command
rake test:isolated            # Show which test files fail when run in isolation
rake test:slow                # Show bottom 25 tests wrt time
rake typecheck                # Type check the code
```

### Initial Testing of the Bootstrap

This is not intended to be run by other developers

* Run the tests from the IDE, observe tests pass using Ruby 2.7.
* Command line:
  * `asdf list all ruby 3.2`
  * `asdf install ruby 3.2.2`
* Restart the IDE
* Configure the Run Configuration in the IDE to use Ruby 3.2.2 provided by asdf
* Run the tests from the IDE, observe tests pass using Ruby 3.2.2.
* Command line (in the project directory):
  * `asdf local ruby 3.2.2`
  * `asdf reshim ruby`
  * `ruby -v`
  * `gem install rubocop`
  * `gem update --system 3.4.22` # as suggested after the previous command
  * `rubocop`

## Notes to Reviewers

* I've never used RBS, Sorbet or Steep previously but took a stab at introducing
  RBS to this project with Steep.  `bundle exec steep check` fails, for a
  production code base, I would like to revisit this. I chose Steep as it is
  [supported by my IDE](https://www.jetbrains.com/help/ruby/rbs.html#steep_type_checking).
* The instructions said to sort users by last name, but testing showed that
  first name was required as a tie breaker to match the example output.
* I expected to want to discard duplicate users (by Id) during loading but
  testing showed that matching the example output required retaining them.
  `Company::PRESERVE_DUPLICATE_USERS` was added to allow toggling this behavior.
