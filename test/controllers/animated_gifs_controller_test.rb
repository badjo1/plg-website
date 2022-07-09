require "test_helper"

class AnimatedGifsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @animated_gif = animated_gifs(:one)
  end

  test "should get index" do
    get animated_gifs_url
    assert_response :success
  end

  test "should get new" do
    get new_animated_gif_url
    assert_response :success
  end

  test "should create animated_gif" do
    assert_difference("AnimatedGif.count") do
      post animated_gifs_url, params: { animated_gif: { description: @animated_gif.description, title: @animated_gif.title, user_id: @animated_gif.user_id } }
    end

    assert_redirected_to animated_gif_url(AnimatedGif.last)
  end

  test "should show animated_gif" do
    get animated_gif_url(@animated_gif)
    assert_response :success
  end

  test "should get edit" do
    get edit_animated_gif_url(@animated_gif)
    assert_response :success
  end

  test "should update animated_gif" do
    patch animated_gif_url(@animated_gif), params: { animated_gif: { description: @animated_gif.description, title: @animated_gif.title, user_id: @animated_gif.user_id } }
    assert_redirected_to animated_gif_url(@animated_gif)
  end

  test "should destroy animated_gif" do
    assert_difference("AnimatedGif.count", -1) do
      delete animated_gif_url(@animated_gif)
    end

    assert_redirected_to animated_gifs_url
  end
end
