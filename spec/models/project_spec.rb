require 'rails_helper'

RSpec.describe Addcustomer, type: :model do
  context "validation tests" do
    it "ensures the first name is present when creating customer" do
      customer = Addcustomer.new(lastname: "Lastname", homeaddress: "123 Main St", dateofbirth: "2000-01-01")
      expect(customer.valid?).to eq(false)
    end
    
    it "ensures the last name is present when creating customer" do
      customer = Addcustomer.new(name: "Firstname", homeaddress: "123 Main St", dateofbirth: "2000-01-01")
      expect(customer.valid?).to eq(false)
    end
    
    it "should not be able to save customer when first name and last name missing" do
      customer = Addcustomer.new(homeaddress: "123 Main St", dateofbirth: "2000-01-01")
      expect(customer.save).to eq(false)
    end
    
    it "should be able to save customer when have first name, last name, and home address" do
      customer = Addcustomer.new(name: "Firstname", lastname: "Lastname", homeaddress: "123 Main St", dateofbirth: "2000-01-01")
      expect(customer.save).to eq(true)
    end
  end
  
  context "Edit customer" do  
    before(:each) do
      @customer = Addcustomer.create(name: "Firstname", lastname: "Lastname", homeaddress: "123 Main St", dateofbirth: "2000-01-01")
    end
    
    it "ensures the first name is present when editing customer" do
      @customer.update(name: "New Firstname")
      expect(@customer.name).to eq("New Firstname")
    end
    
    it "ensures the last name is present when editing customer" do
      @customer.update(lastname: "New Lastname")
      expect(@customer.lastname).to eq("New Lastname")
    end
    
    it "ensures the home address is present when editing customer" do
      @customer.update(homeaddress: "456 Second St")
      expect(@customer.homeaddress).to eq("456 Second St")
    end
    
    it "ensures the birthday is present when editing customer" do
      @customer.update(dateofbirth: "1990-01-01")
      expect(@customer.dateofbirth).to eq(Date.parse("1990-01-01"))
    end
  end
end
