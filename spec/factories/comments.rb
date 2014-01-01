FactoryGirl.define do
  factory :comment do
    answer "I think you are wrong bro"

    association :user
    association :post
  end
end
