FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              { person.last.kanji + "あア"}
    firstname             { person.first.kanji + "あア"}
    lastname_furigana     { person.last.katakana }
    firstname_furigana    { person.first.katakana }
    birthday              {Faker::Date.birthday(min_age: 6, max_age: 92)}
  end
end
