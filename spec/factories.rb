FactoryGirl.define do
  sequence(:email) {|n| "user-#{n}@example.com" }

  factory :user do
    email
    name 'Peter Parker'
    password 'test'
    role 'registration'

    factory :admin_user do
      role 'admin'
    end

    factory :random_user do
      name { Faker::Name.name }
      email { Faker::Internet.email }
    end
  end
end
