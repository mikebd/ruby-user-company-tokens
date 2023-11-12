# ruby-user-company-tokens

A coding challenge to compute token top ups for company users.

The contents of this readme are geared towards explaining my approach to this
coding challenge. They do not reflect the readme contents I would provide in a
production repository.

## Table of Contents

* [Bootstrap of this repository](#bootstrap-of-this-repository)
* [Development Environment](#development-environment)

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

### Initial Testing of the Bootstrap

* Run the Docker container from the IDE, observe tests pass using Ruby 3.2.
* Run the tests from the IDE, observe tests pass using Ruby 2.7.
* Command line:
  * `asdf list all ruby 3.2`
  * `asdf install ruby 3.2.2`
* Restart the IDE
* Configure the Run Configuration in the IDE to use Ruby 3.2.2 provided by asdf
* Run the tests from the IDE, observe tests pass using Ruby 3.2.2.
* Command line (in the project directory):
  * `asdf local ruby latest:3.2`
  * `asdf reshim ruby`
  * `ruby -v`
  * `gem install rubocop`
  * `gem update --system 3.4.22` # as suggested after the previous command
  * `rubocop`
