class BorrowsController < ApplicationController
  def new
    @book = Book.find(params[:id])
    @borrow_request = Borrow.new
  end

  def create
    request_borrow = params[:borrow].permit(
      :book_id, :user_id
    ).merge(is_returned: false)

    is_borrowing = Borrow.find_by(request_borrow)
    if is_borrowing
      flash[:alert] = '※すでに借りている本です'
      redirect_to books_path
    else
      new_borrow = Borrow.new(request_borrow);
      if new_borrow.save!
        flash[:success] = '以下の本を借りました！'
        redirect_to book_path(id: request_borrow[:book_id])
      else
        flash[:alert] = '本を借りる登録に失敗しました'
        redirect_to root_path
      end
    end
  end
end
