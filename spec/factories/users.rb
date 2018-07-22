FactoryBot.define do
  factory :user do
    name "Colin Fred"
    email { Faker::Internet.email }
    password '123456'
    password_confirmation '123456'
    role :client

    trait :admin do
      name "Bob Marley"
      email { Faker::Internet.email }
      password '123456'
      password_confirmation '123456'
      role :admin
    end

  end
end
