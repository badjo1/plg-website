require "application_system_test_case"

class AnimatedGifsTest < ApplicationSystemTestCase
  setup do
    @animated_gif = animated_gifs(:one)
  end

  test "visiting the index" do
    visit animated_gifs_url
    assert_selector "h1", text: "Animated gifs"
  end

  test "should create animated gif" do
    visit animated_gifs_url
    click_on "New animated gif"

    fill_in "Description", with: @animated_gif.description
    fill_in "Title", with: @animated_gif.title
    fill_in "User", with: @animated_gif.user_id
    click_on "Create Animated gif"

    assert_text "Animated gif was successfully created"
    click_on "Back"
  end

  test "should update Animated gif" do
    visit animated_gif_url(@animated_gif)
    click_on "Edit this animated gif", match: :first

    fill_in "Description", with: @animated_gif.description
    fill_in "Title", with: @animated_gif.title
    fill_in "User", with: @animated_gif.user_id
    click_on "Update Animated gif"

    assert_text "Animated gif was successfully updated"
    click_on "Back"
  end

  test "should destroy Animated gif" do
    visit animated_gif_url(@animated_gif)
    click_on "Destroy this animated gif", match: :first

    assert_text "Animated gif was successfully destroyed"
  end
end
