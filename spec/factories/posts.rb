FactoryGirl.define do
  factory :post do
    title "My first post"
    description "This is my first post of the year"

    association :user
    association :group
  end
end
