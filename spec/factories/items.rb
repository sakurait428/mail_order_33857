FactoryBot.define do
  factory :item do
    name                 {Gimei.name.first.kanji}
    info_product         {Gimei.name.first.kanji}
    info_brand           {Gimei.name.first.kanji}
    info_material        {Gimei.name.first.kanji}
    price                {Faker::Number.within(range: 300..9999999)}
    info_size            {Faker::Number.within(range: 10..100)}
    gender               {"メンズ"}
    category_id          {Faker::Number.within(range: 2..11)}
    stock_quantity       {Faker::Number.within(range: 1..10)}
    association :category

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test.jpg'), filename: 'test.jpg')
    end
  end
end
