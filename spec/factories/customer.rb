FactoryGirl.define do
  factory :customer do
    username "meow"
    email Faker::Internet.email
    date_of_birth Date.new(1990-10-13)
    password "password"
    password_confirmation "password"

  end
end
