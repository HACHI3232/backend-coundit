class AuthController < ApplicationController
  def create
    user = User.find_by(email: auth_params[:email])
    if user&.valid_password?(auth_params[:password])
      # 現在の時間に、例えば24時間（86400秒）を加えて有効期限を設定
      exp = Time.now.to_i + 86400
      token = JWT.encode({ user_id: user.id, exp: exp }, Rails.application.secrets.secret_key_base)
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
