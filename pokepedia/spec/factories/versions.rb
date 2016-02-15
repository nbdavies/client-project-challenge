FactoryGirl.define do
  factory :version do
    association :article, factory: :article
    association :author, factory: :user
    content { Faker::Lorem.paragraph }
    published { [true, false].sample }
    image_url { Faker::Avatar.image }
    image_caption { Faker::Lorem.sentence }
  end
end
