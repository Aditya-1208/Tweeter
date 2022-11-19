class PasswordResetsController < ApplicationController
  def new

  end

  def create
    @user = User.find_by(email: params[:email])

    if @user.present?
      #send email
      PasswordMailer.with(user: @user).reset.deliver_later
    end
      redirect_to root_path, notice: "If that email exists in our database, you would've got a password reset link!"

  end

  def edit
    @user = User.find_signed!(params[:token],purpose: "password reset")
    # binding.irb
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to login_path, alert: "Token Expired, Please try again!"

  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password reset")
    if @user.update(password_params)
      redirect_to login_path, notice: "Password reset successfully!"
    else
      render :edit

    end
  end

  private

  def password_params
    params.require(:user).permit(:password,:password_confirmation)
  end

end