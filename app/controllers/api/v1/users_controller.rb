class Api::V1::UsersController < ApiController
  # 通常、常時ログインなどでは、cookieにセッション情報が格納されますが、Railsではリクエストのたびにcookieを自動的に取得します。
  # そして、これこそがCSRFがつけいるセキュリティの穴なんです。
  # Railsアプリケーションに対して、外からPOST, PUT, DELETE送信しようとすると、422エラー・Can't verify CSRF token authenticityエラーが出ます。 
  # protect_from_forgeryによって、アクション実行前に正しいトークンが付随されているかをチェックしています。
  # RailsではViewでform_forやform_tagを使うと、自動でCSRF対策用のトークンを埋め込んでくれています。
  # authenticity_token をフォームに埋め込んでおく」か「X-CSRF-Token をリクエストヘッダーに設定しておく」

  # protect_from_forgery except: [:create, :update, :destroy]
  # CSRF対策の除外設定を追加する。

  before_action :set_user, only: [:show]

  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500
  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404


  def index
    @users = User.all # same User.select(:id, :name)
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params)
    # @user = User.new(name: params[:name], email: params[:email], 
    #   password: params[:password], 
    #   password_confirmation: params[:password_confirmation])
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      # params.fetch(:user, {}).permit(:name, :email, :password, :password_confirmation)
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end

end