class ApplicationController < ActionController::API
  # ユーザー認証を行うメソッド
  def authenticate_user!
    # リクエストヘッダーからAuthorizationを取得
    header = request.headers['Authorization']
    # Authorizationヘッダーが存在する場合、Bearerトークンを取り出す
    header = header.split(' ').last if header

    begin
      # JWTをデコードし、秘密鍵を使って検証
      @decoded = JWT.decode(header, Rails.application.secrets.secret_key_base)
      # デコードされたJWTからuser_idを取得し、対応するユーザーを検索
      @current_user = User.find(@decoded[0]['user_id'])
    rescue ActiveRecord::RecordNotFound, JWT::DecodeError
      # ユーザーが見つからないか、JWTのデコードに失敗した場合、Unauthorizedエラーを返す
      render json: { errors: ['Unauthorized'] }, status: :unauthorized
    end
  end
end
