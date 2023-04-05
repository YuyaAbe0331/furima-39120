FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Lorem.characters(number: 10, min_alpha: 4, min_numeric: 1) }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '太郎' }
    kana_first_name       { 'ヤマダ' }
    kana_last_name        { 'タロウ' }
    date_of_birth         { '1993-01-01' }
  end
end
