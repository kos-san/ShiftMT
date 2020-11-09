FactoryBot.define do
  factory :store do
    store_name { 'A店' }
    tel { '0123456789' }
    opening { 9 }
    closing { 18 }
    association :user
  end
end
