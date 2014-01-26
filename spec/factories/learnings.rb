FactoryGirl.define do
  factory :learning do
    sequence(:title) do |n|
      "I learned how to make an awesome TIL database #{n}"
    end
    description 'my first TIl post with a description'
    url 'http://shipitsaturday.herokuapp.com/'
    rank 3

    association :user
  end
end
