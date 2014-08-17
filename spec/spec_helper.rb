if RUBY_VERSION >= '1.9' # dont include <1.9 otherwise this breaks jruby-18mode
  require 'coveralls'
  require 'simplecov'
    SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]
  SimpleCov.start do
    add_group 'Libraries', 'lib'
    add_group 'Spec', 'spec'
  end
end

require 'twitter_web_intents'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
  config.color = true
end