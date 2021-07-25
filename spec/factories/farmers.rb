FactoryBot.define do
  Faker::Config.locale = :ja
  factory :farmer do
    transient do
      person {Gimei.name}
    end
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    name                  { Faker::Games::Pokemon.name }
    representative        { person.last.kanji }
    representative_kana   { person.last.katakana }
    birthday              { Faker::Date.in_date_period }
    postal_code           { Faker::Address.postcode }
    prefecture_id         { Faker::Number.within(range: 2..48) }
    municipality          { Faker::Address.state }
    address               { Faker::Address.street_address}
    building_name         { Faker::Address.street_name }
    phone_number          { Faker::PhoneNumber.subscriber_number(length: 11) }
    career                { Faker::Lorem.sentence }
    comment               { Faker::Lorem.sentence }
    point                 { Faker::Lorem.sentence }
  end
end
  