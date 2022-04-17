class UserSessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(eth_address: session_params[:eth_address].downcase)
    if (  user &&                                                            
          user.authenticated?("nonce", session_params[:eth_message]) &&
          !user.nonce_reset_expired? &&
          user.eth_address.eql?(recovered_address(session_params[:eth_message], session_params[:eth_signature]))
        )

      log_in user
      session_params[:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or_to(user_path( user ), notice: t('.notice')) 
    else
      flash.now[:danger] = t('.danger') #"Signature verification failed!"
      render action: 'new'
    end
  end

  def destroy
    log_out
    redirect_to(:root, notice: t('.notice'))
  end

private

  def recovered_address(message, signature)
    signature_pubkey = Eth::Signature.personal_recover message, signature
    signature_address = Eth::Util.public_key_to_address signature_pubkey
    signature_address.to_s.downcase
  end

  def session_params
    params.require(:user_session).permit(:eth_address, :eth_message, :eth_signature, :remember_me)
  end

end
