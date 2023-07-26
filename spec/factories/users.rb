FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              {Faker::Name.last_name + "あア"}
    firstname             {Faker::Name.first_name + "あア"}
    lastname_furigana     {"ヤマダ"}
    firstname_furigana    {"タロウ"}
    birthday              {Faker::Date.birthday(min_age: 6, max_age: 92)}
  end
end
