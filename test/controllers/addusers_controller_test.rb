require "test_helper"

class AddusersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adduser = addusers(:one)
  end

  test "should get index" do
    get addusers_url
    assert_response :success
  end

  test "should get new" do
    get new_adduser_url
    assert_response :success
  end

  test "should create adduser" do
    assert_difference('Adduser.count') do
      post addusers_url, params: { adduser: { dateofbirth: @adduser.dateofbirth, homeaddress: @adduser.homeaddress, lastname: @adduser.lastname, name: @adduser.name } }
    end

    assert_redirected_to adduser_url(Adduser.last)
  end

  test "should show adduser" do
    get adduser_url(@adduser)
    assert_response :success
  end

  test "should get edit" do
    get edit_adduser_url(@adduser)
    assert_response :success
  end

  test "should update adduser" do
    patch adduser_url(@adduser), params: { adduser: { dateofbirth: @adduser.dateofbirth, homeaddress: @adduser.homeaddress, lastname: @adduser.lastname, name: @adduser.name } }
    assert_redirected_to adduser_url(@adduser)
  end

  test "should destroy adduser" do
    assert_difference('Adduser.count', -1) do
      delete adduser_url(@adduser)
    end

    assert_redirected_to addusers_url
  end
end
