FactoryGirl.define do
  factory :article do
    association :author, factory: :user
    title { Faker::Lorem.word }
    association :versions, factory: :version
  end
end
