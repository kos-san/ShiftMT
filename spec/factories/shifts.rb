FactoryBot.define do
  factory :shift do
    workday { Date.today }
    start { Time.now }
    ending { Time.now }
    text { Faker::Lorem.sentence }

    association :user
    association :store
  end
end
