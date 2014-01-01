FactoryGirl.define do
  factory :post do
    title "My last post"
    description "You guys are like so 2013"

    association :user
    association :group
  end
end
