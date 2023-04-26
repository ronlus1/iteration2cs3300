require "rails_helper"

RSpec.feature "Customers", type: :feature do
  context "Update customer" do
    let(:addcustomers) { AddcustomersController.create(firstname: "Test first name", lastname: "Test last name", homeaddress: "Test address", birthday: Date.today) }
    
    before(:each) do
      visit edit_customer_path(customer)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "Firstname", with: "New first name"
        fill_in "Lastname", with: "New last name"
        fill_in "Homeaddress", with: "New address"
        fill_in "Birthday", with: Date.today - 30.years
      end

      click_button "Update Customer"
      expect(page).to have_content("Customer was successfully updated")
    end

    scenario "should fail with blank first name" do
      within("form") do
        fill_in "Firstname", with: ""
      end

      click_button "Update Customer"
      expect(page).to have_content("Firstname can't be blank")
    end

    scenario "should fail with blank last name" do
      within("form") do
        fill_in "Lastname", with: ""
      end

      click_button "Update Customer"
      expect(page).to have_content("Lastname can't be blank")
    end

    scenario "should fail with blank home address" do
      within("form") do
        fill_in "Homeaddress", with: ""
      end

      click_button "Update Customer"
      expect(page).to have_content("Homeaddress can't be blank")
    end

    scenario "should fail with invalid birthday" do
      within("form") do
        fill_in "Birthday", with: Date.today + 1.day
      end

      click_button "Update Customer"
      expect(page).to have_content("Birthday must be before today")
    end
  end
end
