FactoryBot.define do
  factory :user do
    last_name               {Gimei.name.last.kanji}
    first_name              {Gimei.name.first.kanji}
    last_name_kana          {Gimei.name.last.katakana}
    first_name_kana         {Gimei.name.first.katakana}
    email                   {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password                {password}
    password_confirmation   {password}
    user_birth_date         {Faker::Date.between(from: '1930-01-01', to: '2016-12-31')}
    postal_code             {Faker::Number.number(digits: 7).to_s}
    prefecture_id           {Faker::Number.within(range: 2..48)}
    city                    {Gimei.address.city.kanji}
    address                 {Gimei.address.town.kanji}
    phone_number            {Faker::Number.number(digits: 10)}
  end
end
