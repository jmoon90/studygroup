FactoryGirl.define do
  factory :group do
    name 'Hartl'
    size 12
    association :tutorial
  end
end
