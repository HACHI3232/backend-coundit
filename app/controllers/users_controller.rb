class UsersController < ApplicationController
  # ユーザー登録（サインアップ）のアクション
  def create
    user = User.new(user_params)
    if user.save
      # 登録成功時の処理
      render json: { status: 'success', user: user }, status: :created
    else
      # 登録失敗時の処理
      render json: { status: 'error', errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
