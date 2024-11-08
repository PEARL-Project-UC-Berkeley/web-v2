require "test_helper"

class PearlMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pearl_member = pearl_members(:one)
  end

  test "should get index" do
    get pearl_members_url
    assert_response :success
  end

  test "should get new" do
    get new_pearl_member_url
    assert_response :success
  end

  test "should create pearl_member" do
    assert_difference("PearlMember.count") do
      post pearl_members_url, params: { pearl_member: { current_member: @pearl_member.current_member, description: @pearl_member.description, email: @pearl_member.email, first_name: @pearl_member.first_name, last_name: @pearl_member.last_name, role: @pearl_member.role } }
    end

    assert_redirected_to pearl_member_url(PearlMember.last)
  end

  test "should show pearl_member" do
    get pearl_member_url(@pearl_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_pearl_member_url(@pearl_member)
    assert_response :success
  end

  test "should update pearl_member" do
    patch pearl_member_url(@pearl_member), params: { pearl_member: { current_member: @pearl_member.current_member, description: @pearl_member.description, email: @pearl_member.email, first_name: @pearl_member.first_name, last_name: @pearl_member.last_name, role: @pearl_member.role } }
    assert_redirected_to pearl_member_url(@pearl_member)
  end

  test "should destroy pearl_member" do
    assert_difference("PearlMember.count", -1) do
      delete pearl_member_url(@pearl_member)
    end

    assert_redirected_to pearl_members_url
  end
end
