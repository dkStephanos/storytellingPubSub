require "application_system_test_case"

class TellsTest < ApplicationSystemTestCase
  setup do
    @tell = tells(:one)
  end

  test "visiting the index" do
    visit tells_url
    assert_selector "h1", text: "Tells"
  end

  test "creating a Tell" do
    visit tells_url
    click_on "New Tell"

    fill_in "Keyword", with: @tell.keyword
    fill_in "Tellername", with: @tell.tellerName
    fill_in "Title", with: @tell.title
    click_on "Create Tell"

    assert_text "Tell was successfully created"
    click_on "Back"
  end

  test "updating a Tell" do
    visit tells_url
    click_on "Edit", match: :first

    fill_in "Keyword", with: @tell.keyword
    fill_in "Tellername", with: @tell.tellerName
    fill_in "Title", with: @tell.title
    click_on "Update Tell"

    assert_text "Tell was successfully updated"
    click_on "Back"
  end

  test "destroying a Tell" do
    visit tells_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tell was successfully destroyed"
  end
end
