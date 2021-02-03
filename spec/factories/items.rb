FactoryBot.define do
  factory :item do
    image           { Faker::Lorem.sentence }
    name            { Faker::Lorem.sentence }
    explanation     { Faker::Lorem.sentence }
    price           { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id     { Faker::Number.between(from: 2, to: 3) }
    state_id        { Faker::Number.between(from: 2, to: 3) }
    burden_id       { Faker::Number.between(from: 2, to: 3) }
    area_id         { Faker::Number.between(from: 2, to: 3) }
    days_id         { Faker::Number.between(from: 2, to: 3) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/tea.jpg'), filename: 'test.jpg')
    end
  end
end
