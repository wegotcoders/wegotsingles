FactoryGirl.define do
  factory :customer do
    username "fred"
    email "fred@bloggs.com"
    date_of_birth Date.new(1990,10,13)
    password "password"
    password_confirmation "password"
    confirmation_sent_at Time.now - 1.day
    confirmed_at Time.now
  end
end
