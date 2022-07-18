require "test_helper"

class AnimatedBlocksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animated_block = animated_blocks(:one)
  end

  test "should get index" do
    get animated_blocks_url
    assert_response :success
  end

  test "should get new" do
    get new_animated_block_url
    assert_response :success
  end

  test "should create animated_block" do
    assert_difference("AnimatedBlock.count") do
      post animated_blocks_url, params: { animated_block: { animated_gif_id: @animated_block.animated_gif_id, block_style: @animated_block.block_style, block_word: @animated_block.block_word } }
    end

    assert_redirected_to animated_block_url(AnimatedBlock.last)
  end

  test "should show animated_block" do
    get animated_block_url(@animated_block)
    assert_response :success
  end

  test "should get edit" do
    get edit_animated_block_url(@animated_block)
    assert_response :success
  end

  test "should update animated_block" do
    patch animated_block_url(@animated_block), params: { animated_block: { animated_gif_id: @animated_block.animated_gif_id, block_style: @animated_block.block_style, block_word: @animated_block.block_word } }
    assert_redirected_to animated_block_url(@animated_block)
  end

  test "should destroy animated_block" do
    assert_difference("AnimatedBlock.count", -1) do
      delete animated_block_url(@animated_block)
    end

    assert_redirected_to animated_blocks_url
  end
end
