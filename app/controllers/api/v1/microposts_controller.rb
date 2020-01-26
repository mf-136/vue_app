class Api::V1::MicropostsController < ApiController

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      render json: @micropost, status: :created
    else
      render json: { errors: @micropost.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  end



  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end

    # 現在ログイン中のユーザーを返す (いる場合)
    def current_user
      if session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
      end
    end

end
