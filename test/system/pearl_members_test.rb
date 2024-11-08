require "application_system_test_case"

class PearlMembersTest < ApplicationSystemTestCase
  setup do
    @pearl_member = pearl_members(:one)
  end

  test "visiting the index" do
    visit pearl_members_url
    assert_selector "h1", text: "Pearl members"
  end

  test "should create pearl member" do
    visit pearl_members_url
    click_on "New pearl member"

    check "Current member" if @pearl_member.current_member
    fill_in "Description", with: @pearl_member.description
    fill_in "Email", with: @pearl_member.email
    fill_in "First name", with: @pearl_member.first_name
    fill_in "Last name", with: @pearl_member.last_name
    fill_in "Role", with: @pearl_member.role
    click_on "Create Pearl member"

    assert_text "Pearl member was successfully created"
    click_on "Back"
  end

  test "should update Pearl member" do
    visit pearl_member_url(@pearl_member)
    click_on "Edit this pearl member", match: :first

    check "Current member" if @pearl_member.current_member
    fill_in "Description", with: @pearl_member.description
    fill_in "Email", with: @pearl_member.email
    fill_in "First name", with: @pearl_member.first_name
    fill_in "Last name", with: @pearl_member.last_name
    fill_in "Role", with: @pearl_member.role
    click_on "Update Pearl member"

    assert_text "Pearl member was successfully updated"
    click_on "Back"
  end

  test "should destroy Pearl member" do
    visit pearl_member_url(@pearl_member)
    click_on "Destroy this pearl member", match: :first

    assert_text "Pearl member was successfully destroyed"
  end
end
