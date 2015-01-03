require 'rubygems'

ENV['RAILS_ENV'] = 'test'

require File.expand_path('../../config/environment', __FILE__)

require 'rspec/rails'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.mock_with :rspec
  config.expect_with :rspec
  config.include RSpec::Rails::RequestExampleGroup, type: :request, file_path: /spec/
end

require 'capybara/rspec'
