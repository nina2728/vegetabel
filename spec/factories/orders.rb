FactoryBot.define do
  Faker::Config.locale = :ja
  factory :order do
    postal_code   { Faker::Address.postcode }
    prefecture_id { Faker::Number.within(range: 2..48) }
    municipality  { Faker::Address.state }
    address       { Faker::Address.street_address }
    building_name { Faker::Address.street_name }
    token         { Faker::Crypto.md5 }
    user_id    
    item_id
  end
end