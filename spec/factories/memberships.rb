FactoryGirl.define do
  factory :membership do
    sequence :group_id do |n|
      180 + "#{n}".to_i
    end
    user_id 93
  end
end
