class CreateTestData
  @@test_users = [
    {name: '蜂の巣太郎', email: 'beenos@example.com'},
    {name: '蜂の巣花子', email: 'tenso@example.com'}
  ]

  @@test_books = [
    {isbn_code: '9784797386660'},
    {isbn_code: '9784422100517'},
    {isbn_code: '9784863542457'},
    {isbn_code: '9784798153094'},
    {isbn_code: '9784295005520'},
    {isbn_code: '9784822237448'},
    {isbn_code: '9784873117782'},
    {isbn_code: '9784797396805'},
    {isbn_code: '9784873115658'},
    {isbn_code: '9784822257903'},
    {isbn_code: '9784532321437'}
  ]

  @@test_borrows = [
    {book_id: 1, user_id: 1, created_at: '2020-01-01 12:00:00'}, 
    {book_id: 2, user_id: 1, created_at: '2020-01-01 12:00:00'}
  ]

  @@test_returns = [
    {borrow_id: 1, created_at: '2020-01-01 13:00:00'}
  ]

  def self.import
    @@test_users.each do |user|
      User.create(user) unless User.find_by(user)
    end

    @@test_books.each do |test_book|
      response = RequestBookInfo.search(test_book[:isbn_code])
      registered = Book.find_by(isbn_code: test_book[:isbn_code])
      if response && !registered
        book = Book.new
        book.title = response.title
        book.sub_title = response.sub_title
        book.author = response.author
        book.isbn_code = response.isbn
        book.image_url = response.large_image_url
        book.caption = response.item_caption
        book.item_url = response.item_url
        book.released_at = response.sales_date
        book.save!
      elsif registered
        puts "「#{response.title}」は登録済"
      else
        puts "ISBN : #{test_book[:isbn_code]}は見つかりませんでした"
      end
      
    end

    @@test_borrows.each do |borrow|
      Borrow.create(borrow) unless Borrow.find_by(borrow)
    end

    @@test_returns.each do |return_data|
      Return.create(return_data) unless Return.find_by(return_data)
    end
  end
end
