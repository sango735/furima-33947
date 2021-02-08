FactoryBot.define do
  factory :order_address do
    token           { 'tok_abcdefghijk00000000000000000' }
    postal_code     { '123-4567' }
    area_id         { Faker::Number.between(from: 2, to: 3) }
    municipality    { '横浜市緑区' }
    town            { '123' }
    building_name   { 'test' }
    phone_number    { '09012345678' }
  end
end
