require "rails_helper"

RSpec.describe Customer, type: :model do
  it "should create a new customer with valid attributes" do
    customer = Customer.new(FactoryGirl.attributes_for(:customer))
    expect(customer).to be_valid
  end

  describe "username" do
    it "should be present" do
      customer = Customer.new(FactoryGirl.attributes_for(:customer, username: ""))
      expect(customer).to_not be_valid
    end
    it "should be unique" do
      customer = FactoryGirl.create(:customer)
      customer2 = Customer.new(FactoryGirl.attributes_for(:customer))
      expect(customer2).to_not be_valid
    end
  end

  describe "date of birth" do
    it "should have a value" do
      customer = Customer.new(FactoryGirl.attributes_for(:customer, date_of_birth: ""))
      expect(customer).to_not be_valid
    end

    it "should not be later than 18 years ago" do
      customer = Customer.new(FactoryGirl.attributes_for(:customer, date_of_birth: Date.today - (17.years+364.days)))
      expect(customer).to_not be_valid
      expect(customer.errors.messages[:date_of_birth]).to include("Sorry but you're too young to use this site!")
    end
  end
end
