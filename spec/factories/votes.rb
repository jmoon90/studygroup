FactoryGirl.define do
  factory :vote do
    association :learning
    association :user
  end
end
