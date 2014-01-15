FactoryGirl.define do
  factory :tagging do
    association :tag
    taggable_type 'Post'
    taggable_id '2'
  end
end
