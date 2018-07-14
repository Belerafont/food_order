FactoryBot.define do
  factory :user do
    organization
    name "Colin Fred"
    email 'Colin@example.com'
    password 123456
    password_confirmation 123456
  end
end
