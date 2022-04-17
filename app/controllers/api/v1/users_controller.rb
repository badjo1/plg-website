class Api::V1::UsersController < ApiController
  rescue_from Eth::Address::CheckSumError, with: :invalid_check_sum

  # creates a public API that allows fetching the user nonce by address
  def show
    
    # checks the parameter is a valid eth address
    #todo move validation to User Model
    params_address = Eth::Address.new params[:id]
    
    user = User.find_or_create_by(eth_address: params[:id].downcase)
    user.create_nonce_digest
    render json: [nonce_token: user.nonce_token]
  end

  private

    def invalid_check_sum(exception)
      render json: nil
    end
end