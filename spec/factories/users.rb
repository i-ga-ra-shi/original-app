FactoryBot.define do
    factory :user do
      school {Faker::Name.last_name}
      email {Faker::Internet.free_email}
      password {Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
    end
  end