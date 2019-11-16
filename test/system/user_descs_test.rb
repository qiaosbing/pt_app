require "application_system_test_case"

class UserDescsTest < ApplicationSystemTestCase
  setup do
    @user_desc = user_descs(:one)
  end

  test "visiting the index" do
    visit user_descs_url
    assert_selector "h1", text: "User Descs"
  end

  test "creating a User desc" do
    visit user_descs_url
    click_on "New User Desc"

    fill_in "Mailbox", with: @user_desc.mailbox
    fill_in "Phone", with: @user_desc.phone
    fill_in "Remark", with: @user_desc.remark
    fill_in "Units", with: @user_desc.units
    fill_in "User", with: @user_desc.user_id
    fill_in "User name", with: @user_desc.user_name
    click_on "Create User desc"

    assert_text "User desc was successfully created"
    click_on "Back"
  end

  test "updating a User desc" do
    visit user_descs_url
    click_on "Edit", match: :first

    fill_in "Mailbox", with: @user_desc.mailbox
    fill_in "Phone", with: @user_desc.phone
    fill_in "Remark", with: @user_desc.remark
    fill_in "Units", with: @user_desc.units
    fill_in "User", with: @user_desc.user_id
    fill_in "User name", with: @user_desc.user_name
    click_on "Update User desc"

    assert_text "User desc was successfully updated"
    click_on "Back"
  end

  test "destroying a User desc" do
    visit user_descs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "User desc was successfully destroyed"
  end
end
