class UsersController < ApplicationController
  include SessionsHelper
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    is_existing = User.find_by(name: @user.name, email: @user.email)
    if is_existing
      flash[:alert] = '※このネームとアドレスは登録済です'
      render "new"
    else
      if @user.save
        log_in @user
        flash[:success] = 'ユーザーを登録しました！'
        redirect_to @user
      else
        flash[:alert] = 'ユーザー登録に失敗しました'
        render "new"
      end
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "変更が成功しました"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
