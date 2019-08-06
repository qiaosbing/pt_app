require 'test_helper'

class UserDescsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_desc = user_descs(:one)
  end

  test "should get index" do
    get user_descs_url
    assert_response :success
  end

  test "should get new" do
    get new_user_desc_url
    assert_response :success
  end

  test "should create user_desc" do
    assert_difference('UserDesc.count') do
      post user_descs_url, params: { user_desc: { mailbox: @user_desc.mailbox, phone: @user_desc.phone, remark: @user_desc.remark, units: @user_desc.units, user_id: @user_desc.user_id, user_name: @user_desc.user_name } }
    end

    assert_redirected_to user_desc_url(UserDesc.last)
  end

  test "should show user_desc" do
    get user_desc_url(@user_desc)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_desc_url(@user_desc)
    assert_response :success
  end

  test "should update user_desc" do
    patch user_desc_url(@user_desc), params: { user_desc: { mailbox: @user_desc.mailbox, phone: @user_desc.phone, remark: @user_desc.remark, units: @user_desc.units, user_id: @user_desc.user_id, user_name: @user_desc.user_name } }
    assert_redirected_to user_desc_url(@user_desc)
  end

  test "should destroy user_desc" do
    assert_difference('UserDesc.count', -1) do
      delete user_desc_url(@user_desc)
    end

    assert_redirected_to user_descs_url
  end
end
