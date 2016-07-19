require "rails_helper"

RSpec.describe Customer, type: :model do
  before(:each) do
    Customer.destroy_all
    @customer = Customer.new(username: "meow", email: Faker::Internet.email, password: "password", password_confirmation: "password")
  end

  it "should create a new customer with valid attributes" do
    expect(@customer).to be_valid
  end

  describe "username" do
    it "should be present" do
      customer = Customer.create(username: "", email: Faker::Internet.email, password: "password", password_confirmation: "password")
      expect(customer).to_not be_valid
    end
    it "should be unique" do
      customer = Customer.create(username: "1meow", email: Faker::Internet.email, password: "password", password_confirmation: "password")
      customer2 = Customer.new(username: "1meow", email: Faker::Internet.email, password: "password", password_confirmation: "password")
      expect(customer2).to_not be_valid
    end
  end
end
