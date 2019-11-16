require "application_system_test_case"

class UserDescsTest < ApplicationSystemTestCase
  setup do
    @user_desc = user_descs(:one)
  end

  test "visiting the index" do
    visit user_descs_url
    assert_selector "h1", text: "Users Descs"
  end

  test "creating a Users desc" do
    visit user_descs_url
    click_on "New Users Desc"

    fill_in "Mailbox", with: @user_desc.mailbox
    fill_in "Phone", with: @user_desc.phone
    fill_in "Remark", with: @user_desc.remark
    fill_in "Units", with: @user_desc.units
    fill_in "Users", with: @user_desc.user_id
    fill_in "Users name", with: @user_desc.user_name
    click_on "Create Users desc"

    assert_text "Users desc was successfully created"
    click_on "Back"
  end

  test "updating a Users desc" do
    visit user_descs_url
    click_on "Edit", match: :first

    fill_in "Mailbox", with: @user_desc.mailbox
    fill_in "Phone", with: @user_desc.phone
    fill_in "Remark", with: @user_desc.remark
    fill_in "Units", with: @user_desc.units
    fill_in "Users", with: @user_desc.user_id
    fill_in "Users name", with: @user_desc.user_name
    click_on "Update Users desc"

    assert_text "Users desc was successfully updated"
    click_on "Back"
  end

  test "destroying a Users desc" do
    visit user_descs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Users desc was successfully destroyed"
  end
end
