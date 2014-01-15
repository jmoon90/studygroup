FactoryGirl.define do
  factory :learning do
    title 'I learned how to make an awesome TIL database'
    description 'my first TIl post with a description'
    url 'http://shipitsaturday.herokuapp.com/'

    association :user
  end
end
