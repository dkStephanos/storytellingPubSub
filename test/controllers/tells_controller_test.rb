require 'test_helper'

class TellsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tell = tells(:one)
  end

  test "should get index" do
    get tells_url
    assert_response :success
  end

  test "should get new" do
    get new_tell_url
    assert_response :success
  end

  test "should create tell" do
    assert_difference('Tell.count') do
      post tells_url, params: { tell: { keyword: @tell.keyword, tellerName: @tell.tellerName, title: @tell.title } }
    end

    assert_redirected_to tell_url(Tell.last)
  end

  test "should show tell" do
    get tell_url(@tell)
    assert_response :success
  end

  test "should get edit" do
    get edit_tell_url(@tell)
    assert_response :success
  end

  test "should update tell" do
    patch tell_url(@tell), params: { tell: { keyword: @tell.keyword, tellerName: @tell.tellerName, title: @tell.title } }
    assert_redirected_to tell_url(@tell)
  end

  test "should destroy tell" do
    assert_difference('Tell.count', -1) do
      delete tell_url(@tell)
    end

    assert_redirected_to tells_url
  end
end
