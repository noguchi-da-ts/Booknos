class ReturnsController < ApplicationController
  include SessionsHelper

  before_action :logged_in_user, only: [:index]
  before_action :correct_user,   only: [:index]

  def index
    borrows = @user.borrows.where(is_returned: false).pluck(:book_id)
    @now_rental_books = Book.where(id: borrows)
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
