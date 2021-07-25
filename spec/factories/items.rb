FactoryBot.define do
  Faker::Config.locale = :ja
  factory :item do
    association :farmer
    name          { Faker::Games::Pokemon.name }
    description   { Faker::Lorem.sentences }
    contents      { Faker::Lorem.sentences }
    price         { Faker::Number.within(range: 300..9_999_999) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    category_id   { Faker::Number.within(range: 2..6) }
    delivery_id   { Faker::Number.within(range: 2..3) }
    shipping_id   { Faker::Number.within(range: 2..4) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end