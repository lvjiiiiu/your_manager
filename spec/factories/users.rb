FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "TEST_NAME#{n}"}
    sequence(:email) { |n| "TEST#{n}@example.com"}
    sequence(:introduction) { |n| "aiueo#{n}"}
    password { 'password' }
    password_confirmation { 'password' }
  end
end