
require "rails_helper"

RSpec.describe AddcustomersController, type: :model do
  context "validation tests" do
    it "ensures the first name is present when creating customer" do
      customer = AddcustomersController.new(lastname: "Lastname", homeaddress: "123 Main St", birthday: "2000-01-01")
      expect(customer.valid?).to eq(false)
    end
    
    it "ensures the last name is present when creating customer" do
      customer = AddcustomersController.new(firstname: "Firstname", homeaddress: "123 Main St", birthday: "2000-01-01")
      expect(customer.valid?).to eq(false)
    end
    
    it "should not be able to save customer when first name and last name missing" do
      customer = AddcustomersController.new(homeaddress: "123 Main St", birthday: "2000-01-01")
      expect(customer.save).to eq(false)
    end
    
    it "should be able to save customer when have first name, last name, and home address" do
      customer = AddcustomersController.new(firstname: "Firstname", lastname: "Lastname", homeaddress: "123 Main St", birthday: "2000-01-01")
      expect(customer.save).to eq(true)
    end
  end
  
  context "Edit customer" do  
    before(:each) do
      @customer = AddcustomersController.create(firstname: "Firstname", lastname: "Lastname", homeaddress: "123 Main St", birthday: "2000-01-01")
    end
    
    it "ensures the first name is present when editing customer" do
      @customer.update(firstname: "New Firstname")
      expect(@customer.firstname == "New Firstname")
    end
    
    it "ensures the last name is present when editing customer" do
      @customer.update(lastname: "New Lastname")
      expect(@customer.lastname == "New Lastname")
    end
    
    it "ensures the home address is present when editing customer" do
      @customer.update(homeaddress: "456 Second St")
      expect(@customer.homeaddress == "456 Second St")
    end
    
    it "ensures the birthday is present when editing customer" do
      @customer.update(birthday: "1990-01-01")
      expect(@customer.birthday == "1990-01-01")
    end
  end
end


