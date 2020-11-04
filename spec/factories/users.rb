FactoryBot.define do
  factory :user do
    name { '山田太郎' }
    phone_num { '09012341234' }
    email { Faker::Internet.free_email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
