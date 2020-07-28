class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  # GET /books
  # GET /books.json
  def index
    @books = Book.paginate(page: params[:page])
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  def ajax_book_register
    @rakuten_book = RequestBookInfo.search(params[:isbn_code])
    @book = Book.new
    if @rakuten_book
      render partial: 'ajax_book_register'
    else
      render partial: 'ajax_manual_register'
    end
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    request_book = params[:book].permit(
      :title, :sub_title, :author, :isbn_code, :released_at, :image_url, :item_url, :caption
    )
    @book = Book.find_by(request_book)
    if @book
      flash[:alert] = '※すでに登録済みの本です'
      redirect_to book_path(id: @book.id)
    else
      new_book = Book.new(request_book);
      if new_book.save
        @book = new_book
        flash[:success] = '本の登録が成功しました！'
        redirect_to book_path(id: new_book.id)
      else
        flash[:alert] = '本の登録に失敗しました。タイトルもしくはISBNコードの文字数が間違っている可能性があります。'
        redirect_to new_book_path
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.fetch(:book, {})
    end
end
