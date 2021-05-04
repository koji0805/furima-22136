FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password  { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    first_name{'田中'}
    last_name{'太郎'}
    first_name_kana{'タナカ'}
    last_name_kana{'タロウ'}
    birthday{'2000年１月２日'}
  end
end