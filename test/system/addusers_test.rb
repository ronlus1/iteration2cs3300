require "application_system_test_case"

class AddusersTest < ApplicationSystemTestCase
  setup do
    @adduser = addusers(:one)
  end

  test "visiting the index" do
    visit addusers_url
    assert_selector "h1", text: "Addusers"
  end

  test "creating a Adduser" do
    visit addusers_url
    click_on "New Adduser"

    fill_in "Dateofbirth", with: @adduser.dateofbirth
    fill_in "Homeaddress", with: @adduser.homeaddress
    fill_in "Lastname", with: @adduser.lastname
    fill_in "Name", with: @adduser.name
    click_on "Create Adduser"

    assert_text "Adduser was successfully created"
    click_on "Back"
  end

  test "updating a Adduser" do
    visit addusers_url
    click_on "Edit", match: :first

    fill_in "Dateofbirth", with: @adduser.dateofbirth
    fill_in "Homeaddress", with: @adduser.homeaddress
    fill_in "Lastname", with: @adduser.lastname
    fill_in "Name", with: @adduser.name
    click_on "Update Adduser"

    assert_text "Adduser was successfully updated"
    click_on "Back"
  end

  test "destroying a Adduser" do
    visit addusers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Adduser was successfully destroyed"
  end
end
