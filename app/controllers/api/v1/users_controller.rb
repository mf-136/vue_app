class Api::V1::UsersController < ApiController
  # 通常、常時ログインなどでは、cookieにセッション情報が格納されますが、Railsではリクエストのたびにcookieを自動的に取得します。
  # そして、これこそがCSRFがつけいるセキュリティの穴なんです。
  # Railsアプリケーションに対して、外からPOST, PUT, DELETE送信しようとすると、422エラー・Can't verify CSRF token authenticityエラーが出ます。 
  # protect_from_forgeryによって、アクション実行前に正しいトークンが付随されているかをチェックしています。
  # RailsではViewでform_forやform_tagを使うと、自動でCSRF対策用のトークンを埋め込んでくれています。
  # authenticity_token をフォームに埋め込んでおく」か「X-CSRF-Token をリクエストヘッダーに設定しておく」

  # protect_from_forgery except: [:create, :update, :destroy]
  # CSRF対策の除外設定を追加する。

  before_action :set_user, only: [:show, :update, :destroy]

  # 拾えなかったExceptionが発生したら500 Internal server errorを応答する
  rescue_from Exception, with: :render_status_500
  # ActiveRecordのレコードが見つからなければ404 not foundを応答する
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404


  def index
    @users = User.all.order(:id) # same User.select(:id, :name)
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

  def update
    if (params[:user][:password].blank?) && (!(@user.update(user_params)))
      @user.errors.add(:password, :blank)
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    elsif params[:user][:password].blank?
      @user.errors.add(:password, :blank)
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    # elsif !([:user][:password].blank?) && ([:user][:password_confirmation].blank?)
    #   @user.errors.add(:password_confirmation," confirmation doesn't match Password")
    #   render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    elsif @user.update(user_params)
      # debugger
      head :no_content
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy! # destroy! メソッドを使うことで削除に失敗した場合に Exception を発生させて、rescue_from Exception で拾うようにしています。
    head :no_content
  end

  private

    def set_user
      @user = User.find(params[:id])
      # @user = User.find(params[:id]).select("id, name, email")
      # @user = User.select('id','name', 'email')
    end

    def user_params
      # NOTE: userパラメータがなかったときはActionController::ParameterMissingのエラーが起きるようになっています。下記の設定をしてあるとuserパラメータの代わりに{}がデフォルト値として評価されるようになります。
      # params.fetch(:user, {}).permit(:name, :email, :password, :password_confirmation)
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
      # NOTE: このコードの戻り値は、許可された属性のみが含まれたparamsのハッシュです (:user属性がない場合はエラーになります)。
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end

end