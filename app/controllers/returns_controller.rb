class ReturnsController < ApplicationController
  include SessionsHelper

  before_action :logged_in_user, only: [:index, :create]
  before_action :correct_user,   only: [:index, :create]

  def index
    borrows = @user.borrows.where(is_returned: false).pluck(:book_id)
    @now_rental_books = Book.where(id: borrows)
  end

  def create
    borrow = Borrow.find_by(user_id: @user.id, book_id: params[:id], is_returned: false)
    puts
    puts
    puts
    p borrow
    puts
    puts
    puts
    if borrow
      borrow.update(is_returned: true)
      Return.create(borrow_id: borrow.id)
      flash[:success] = '本を返却しました！'
    else
      flash[:alert] = '本を返せませんでした'
    end
    redirect_to returns_path
  end

  private

   # ログイン済みユーザーかどうか確認
   def logged_in_user
    unless logged_in?
      store_location
      flash[:alert] = "ログインしてください"
      redirect_to login_url
    end
  end

  # 正しいユーザーかどうか確認
  def correct_user
    @user = current_user
    redirect_to(root_url) unless current_user?(@user)
  end
end
