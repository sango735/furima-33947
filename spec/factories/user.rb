FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}

    gimei = Gimei.name
    first_name            {gimei.first.kanji}
    last_name             {gimei.last.kanji}
    first_name_kana       {gimei.first.katakana}
    last_name_kana        {gimei.last.katakana}
    birthday              {Faker::Date.birthday}
   end
end