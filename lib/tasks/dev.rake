namespace :dev do
  desc "Creates some sample data for testing locally"
  task prime: 'db:migrate' do
    require 'database_cleaner'
    require 'factory_girl_rails'
    include FactoryGirl::Syntax::Methods

    if Rails.env != "development"
      raise "This task can only be create in the development environment"
    end

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean

    puts "Creating development data..."

    puts "***USERS***"
    user = create(:user, email: 'user@example.com', password: 'test')
    puts "User: #{user.email}/#{user.password}"
    puts "***********"

    create_list(:random_user, 5)
    create_list(:random_receipt, 50)

  end
end
