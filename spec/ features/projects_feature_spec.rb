RSpec.feature "Addcustomer", type: :feature do
  context "Create new customer" do
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      @user = FactoryBot.build(:user)
      visit new_addcustomer_path
    end

    scenario "should be successful" do
        fill_in "addcustomer[name]", with: "John"
        fill_in "addcustomer[lastname]", with: "Doe"
        fill_in "addcustomer[homeaddress]", with: "123 Main St"
      click_button "Save"
      expect(page).to have_content("Addcustomer was successfully created.")
      
    end

    scenario "should fail" do
      click_button "Save"
      #expect(page).to have_content("4 errors prohibited this addcustomer from being saved:")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Lastname can't be blank")
      expect(page).to have_content("Homeaddress can't be blank")
    end
  end

  context "Update customer" do
    let(:customer) { Addcustomer.create(name: "John", lastname: "Doe", homeaddress: "123 Main St",dateofbirth: "01/01/1990") }
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit edit_addcustomer_path(customer)
    end

    scenario "should be successful" do
      within("form") do
        fill_in "addcustomer[homeaddress]", with: "456 Main St"
      end
      click_button "Save"
      expect(page).to have_content("Addcustomer was successfully updated.")
    end

    scenario "should fail" do
      within("form") do
        fill_in "addcustomer[name]", with: ""
      end
      click_button "Save"
      expect(page).to have_content("Name can't be blank")
    end
  end

  context "Delete customer" do
    let(:customer) { Addcustomer.create(firstname: "John", lastname: "Doe", homeaddress: "123 Main St", birthday: "01/01/1990") }
    before(:each) do
      user = FactoryBot.create(:user)
      login_as(user)
      visit addcustomers_path
    end

    
  end
end
