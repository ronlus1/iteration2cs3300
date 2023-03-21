require "test_helper"

class AddcustomersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @addcustomer = addcustomers(:one)
  end

  test "should get index" do
    get addcustomers_url
    assert_response :success
  end

  test "should get new" do
    get new_addcustomer_url
    assert_response :success
  end

  test "should create addcustomer" do
    assert_difference('Addcustomer.count') do
      post addcustomers_url, params: { addcustomer: { dateofbirth: @addcustomer.dateofbirth, homeaddress: @addcustomer.homeaddress, lastname: @addcustomer.lastname, name: @addcustomer.name } }
    end

    assert_redirected_to addcustomer_url(Addcustomer.last)
  end

  test "should show addcustomer" do
    get addcustomer_url(@addcustomer)
    assert_response :success
  end

  test "should get edit" do
    get edit_addcustomer_url(@addcustomer)
    assert_response :success
  end

  test "should update addcustomer" do
    patch addcustomer_url(@addcustomer), params: { addcustomer: { dateofbirth: @addcustomer.dateofbirth, homeaddress: @addcustomer.homeaddress, lastname: @addcustomer.lastname, name: @addcustomer.name } }
    assert_redirected_to addcustomer_url(@addcustomer)
  end

  test "should destroy addcustomer" do
    assert_difference('Addcustomer.count', -1) do
      delete addcustomer_url(@addcustomer)
    end

    assert_redirected_to addcustomers_url
  end
end
