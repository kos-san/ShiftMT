FactoryBot.define do
  factory :contact do
    title {Faker::Lorem.sentence}
    text {Faker::Lorem.sentence}

    association :user
    association :store
  end
end
