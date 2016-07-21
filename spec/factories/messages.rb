FactoryGirl.define do
  factory :message do
    content "MyText"
    customer_id 1
    sender_id 1
    receiver_id 1
  end
end
