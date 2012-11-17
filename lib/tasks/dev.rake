namespace :dev do
  desc "Creates some sample data for testing locally"
  task prime: 'db:migrate' do
    require 'database_cleaner'
    require 'factory_girl_rails'

    if Rails.env != "development"
      raise "This task can only be create in the development environment"
    end

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean

    puts "Creating development data..."

    puts "***USERS***"
    user = FactoryGirl.create(:user, email: 'user@example.com', password: 'test')
    puts "User: #{user.email}/#{user.password}"
  end
end
