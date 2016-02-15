FactoryGirl.define do
  factory :user do
    username { Faker::Internet.user_name }
    email { Faker::Internet.email }
    admin true
    password { Faker::Internet.password }
  end
end
