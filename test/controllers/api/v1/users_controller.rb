require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should create new nonce_token" do
    get api_v1_user_url(@user.eth_address)
    assert_response :success
    json_response = JSON.parse(response.body)
    nonce_token = json_response[0]["nonce_token"]
    #user with old token
    assert_not @user.authenticated?("nonce", nonce_token)
    #refesh user so you get the new token
    user_with_nonce = User.find_by(eth_address: @user.eth_address)
    assert user_with_nonce.authenticated?("nonce", nonce_token)
  end

  test "should show nil" do
    get api_v1_user_url("invalid_address")
    assert_response :success
    json_response = JSON.parse(response.body)
    assert_nil(json_response)
  end

  test "should create user" do
    new_eth_address =  "0x71C7656EC7ab88b098defB751B7401B5f6d8976F"
    assert_difference("User.count", +1) do
      get api_v1_user_url(new_eth_address)
    end
    assert_response :success
    assert_difference("User.count", +0) do
      get api_v1_user_url(new_eth_address)
    end
    assert_response :success
  end

end