namespace :app do
  desc "Copy over the example config files"
  task :setup do
    `bundle install --binstubs=bin/stubs`
    puts "Setting up git remote for staging"
    `git remote add staging git@heroku.com:campmaster-staging.git`
    `git remote add production git@heroku.com:campmaster-production.git`

    Rake::Task["db:create:all"].invoke
    Rake::Task["db:schema:load"].invoke
    Rake::Task["db:test:prepare"].invoke
    Rake::Task["dev:prime"].invoke
  end
end
