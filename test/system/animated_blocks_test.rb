require "application_system_test_case"

class AnimatedBlocksTest < ApplicationSystemTestCase
  setup do
    @animated_block = animated_blocks(:one)
  end

  test "visiting the index" do
    visit animated_blocks_url
    assert_selector "h1", text: "Animated blocks"
  end

  test "should create animated block" do
    visit animated_blocks_url
    click_on "New animated block"

    fill_in "Animated gif", with: @animated_block.animated_gif_id
    fill_in "Block style", with: @animated_block.block_style
    fill_in "Block word", with: @animated_block.block_word
    click_on "Create Animated block"

    assert_text "Animated block was successfully created"
    click_on "Back"
  end

  test "should update Animated block" do
    visit animated_block_url(@animated_block)
    click_on "Edit this animated block", match: :first

    fill_in "Animated gif", with: @animated_block.animated_gif_id
    fill_in "Block style", with: @animated_block.block_style
    fill_in "Block word", with: @animated_block.block_word
    click_on "Update Animated block"

    assert_text "Animated block was successfully updated"
    click_on "Back"
  end

  test "should destroy Animated block" do
    visit animated_block_url(@animated_block)
    click_on "Destroy this animated block", match: :first

    assert_text "Animated block was successfully destroyed"
  end
end
