require "application_system_test_case"

class AddcustomersTest < ApplicationSystemTestCase
  setup do
    @addcustomer = addcustomers(:one)
  end

  test "visiting the index" do
    visit addcustomers_url
    assert_selector "h1", text: "Addcustomers"
  end

  test "creating a Addcustomer" do
    visit addcustomers_url
    click_on "New Addcustomer"

    fill_in "Dateofbirth", with: @addcustomer.dateofbirth
    fill_in "Homeaddress", with: @addcustomer.homeaddress
    fill_in "Lastname", with: @addcustomer.lastname
    fill_in "Name", with: @addcustomer.name
    click_on "Create Addcustomer"

    assert_text "Addcustomer was successfully created"
    click_on "Back"
  end

  test "updating a Addcustomer" do
    visit addcustomers_url
    click_on "Edit", match: :first

    fill_in "Dateofbirth", with: @addcustomer.dateofbirth
    fill_in "Homeaddress", with: @addcustomer.homeaddress
    fill_in "Lastname", with: @addcustomer.lastname
    fill_in "Name", with: @addcustomer.name
    click_on "Update Addcustomer"

    assert_text "Addcustomer was successfully updated"
    click_on "Back"
  end

  test "destroying a Addcustomer" do
    visit addcustomers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Addcustomer was successfully destroyed"
  end
end
