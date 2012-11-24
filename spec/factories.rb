FactoryGirl.define do
  sequence(:email) {|n| "user-#{n}@example.com" }

  factory :receipt do
    first_name 'Tony'
    last_name 'Stark'
    zip '12345'

    factory :full_receipt do
      phone '444-444-4444'
      email 'ironman@example.com'
      address '311 Main St'
      city 'New York'
      state 'NY'
    end

    factory :random_receipt do
      first_name { Faker::Name.first_name }
      last_name { Faker::Name.last_name }
      email { Faker::Internet.email }
      phone { Faker::PhoneNumber.phone_number }
      address { Faker::Address.street_address }
      city { Faker::Address.city }
      state { Faker::Address.state }
      zip { Faker::Address.zip_code }
    end
  end

  factory :user do
    email
    name 'Peter Parker'
    password 'test'
    role 'registration'

    factory :admin_user do
      role 'admin'
    end

    factory :receipt_entry_user do
      role 'receipts'
    end

    factory :random_user do
      name { Faker::Name.name }
      email { Faker::Internet.email }
    end
  end
end
