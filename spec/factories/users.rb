FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "j#{n}@aol.com"
    end
    password 'applepie'
  end
end
