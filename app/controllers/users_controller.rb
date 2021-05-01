class UsersController < ApplicationController
  include SessionsHelper
  include UsersHelper
  
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.all.page(params[:page]).per(24)
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
    user = User.find(params[:id])
    user.destroy
    flash[:success] = "#{user.name}さんを削除しました"
    redirect_to users_url
  end

  private
    
end
