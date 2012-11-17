require 'rubygems'
require 'spork'

Spork.prefork do
  unless ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'rspec/autorun'
  require 'email_spec'

  RSpec.configure do |config|
    config.infer_base_class_for_anonymous_controllers = false
    config.use_transactional_fixtures = true
    config.order = "random"
    config.include FactoryGirl::Syntax::Methods
    config.include EmailSpec::Helpers
    config.include EmailSpec::Matchers
  end
end

Spork.each_run do
  if ENV['DRB']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  Dir[Rails.root.join("spec/helpers/**/*.rb")].each {|f| require f}
end
