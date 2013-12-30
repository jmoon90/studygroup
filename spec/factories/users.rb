FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "john#{n}@aol.com" }
    password 'applepie'
  end
end
