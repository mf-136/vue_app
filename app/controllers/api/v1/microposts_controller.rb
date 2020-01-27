class Api::V1::MicropostsController < ApiController

  before_action :set_user, only: [:show, :create]


  rescue_from Exception, with: :render_status_500
  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404

  def index
    @micropost = Micropost.all
    render json: @micropost
  end

  def show
    render json: Micropost.where("user_id = ?", params[:id])
  end

  def create
    @micropost = @user.microposts.build(micropost_params)
    if @micropost.save
      render json: @micropost, status: :created
    else
      render json: { errors: @micropost.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy!
    head :no_content
  end



  private

  def set_user
    @user ||= User.find(params[:id])
  end

  def micropost_params
    params.require(:micropost).permit(:content)
  end

  def render_status_404(exception)
    render json: { errors: [exception] }, status: 404
  end

  def render_status_500(exception)
    render json: { errors: [exception] }, status: 500
  end

end
