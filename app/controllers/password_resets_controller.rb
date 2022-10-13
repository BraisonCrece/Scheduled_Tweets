class PasswordResetsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      # send email
      PasswordMailer.with(user: @user).reset.deliver_now # 'deliver_later' causes email to be sent in background job.
                                                         # the other option is 'deliver_now'
    end
    redirect_to root_path, notice: 'We have sent a link to reset your password'
  end

  def edit
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Your token has expired. Please, try again'
  end

  def update
    @user = User.find_signed!(params[:token], purpose: 'password_reset')
    if @user.update(password_params)
      redirect_to sign_in_path, notice: 'Your password was reset successfully. Please, log in'
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end



end
