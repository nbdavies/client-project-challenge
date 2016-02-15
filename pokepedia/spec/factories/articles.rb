FactoryGirl.define do
  factory :article do
    association :author, factory: :user
    title { Faker::Lorem.word }
  end
end
