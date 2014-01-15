FactoryGirl.define do
  factory :tag do
    sequence(:name) { |n| "tutorial #{n}" }
  end
end
