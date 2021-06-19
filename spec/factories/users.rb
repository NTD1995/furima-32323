FactoryBot.define do
  factory :user do
    nickname {"a"}
    email {Faker::Internet.free_email}
    password  {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name{"田中"}
    last_name{"太郎"}
    first_name_furigana{"タナカ"}
    last_name_furigana{"タロウ"}
    birthday{"1931-01-07"}
  end
end