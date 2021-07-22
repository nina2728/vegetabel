FactoryBot.define do
  Faker::Config.locale = :ja
  factory :user do
    nickname              { Faker::Name }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    full_name_kanji       { person.kanji }
    full_name_kana        { person.katakana }
    birthday              { Faker::Date.in_date_period }
    postal_code           { Faker::Address.postcode }
    prefecture_id         { Faker::Number.within(range: 2..48) }
    municipality          { Faker::Address.state }
    address               { Faker::Address.street_address }
    building_name         { Faker::Address.street_name }
    phone_number          { Faker::PhoneNumber.subscriber_number(length: 11) }
  end
end