class AuthController < ApplicationController
  def create
    user = User.find_by(email: auth_params[:email])
    if user&.valid_password?(auth_params[:password])
      token = JWT.encode({ user_id: user.id }, Rails.application.secrets.secret_key_base)
      render json: { token: token }, status: :created
    else
      render json: { error: 'Invalid credentials' }, status: :unauthorized
    end
  end

    private
    def auth_params
      params.require(:user).permit(:email, :password)
    end
end
