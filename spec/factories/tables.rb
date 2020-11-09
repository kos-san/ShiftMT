FactoryBot.define do
  factory :table do
    workday { Date.today }
    start { Time.now }
    ending { Time.now }

    association :user
    association :store
  end
end
