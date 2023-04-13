FactoryBot.define do
  factory :purchase_address do
    token               { 'tok_abcdefghijk00000000000000000' }
    post_code           { '150-0041' }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    municipality        { '渋谷区' }
    address             { '１丁目１２−１６' }
    building            { 'アジアビル 9F' }
    telephone           { '0123456789' }
  end
end
