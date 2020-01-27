class Api::V1::UsersController < ApiController

  before_action :set_user, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :render_status_404
  rescue_from Exception, with: :render_status_500


  def index
    @users = User.all.order(:id) # SAME: User.select(:id, :name)
    render json: @users
  end

  def show
    render json: @user
  end

  def create
    @user = User.new(user_params) # @user = User.new(name: params[:name], email: params[:email])
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
    elsif @user.update(user_params)
      head :no_content
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy!
    head :no_content
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def render_status_404(exception)
      render json: { errors: [exception] }, status: 404
    end

    def render_status_500(exception)
      render json: { errors: [exception] }, status: 500
    end

end