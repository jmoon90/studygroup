FactoryGirl.define do
  factory :tutorial do
    name "Rails Tutorial"

    association :group
  end
end
