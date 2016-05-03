require 'simplecov'
require 'coveralls'
require 'codeclimate-test-reporter'

formatters = [SimpleCov::Formatter::HTMLFormatter]
formatters << Coveralls::SimpleCov::Formatter if ENV['COVERALLS_REPO_TOKEN']
formatters << CodeClimate::TestReporter::Formatter if ENV['CODECLIMATE_REPO_TOKEN']
 
SimpleCov.formatters = formatters
 
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_valid(record, message = nil)
    message ||= "Expected #{record.inspect} to be valid"
    assert record.valid?, message
  end
  
  def assert_invalid(record, options = {})
    assert record.invalid?, "Expected #{record.inspect} to be invalid"
    options.each do |attribute, message|
      assert_includes record.errors[attribute], message
    end
  end
end

class ActionController::TestCase
  include Devise::TestHelpers
end
