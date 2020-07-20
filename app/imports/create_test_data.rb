class CreateTestData
  @@test_users = [
    {name: '蜂の巣太郎', email: 'beenos@example.com'},
    {name: '蜂の巣花子', email: 'tenso@example.com'}
  ]

  @@test_books = [
    {title: 'サーバーの基本', auther: 'きはし まさひろ', isbn_code: '9784797386660', jan_code: '1920055016803', released_at: '2020-02-28'},
    {title: '人を動かす', auther: 'D.カーネギー', isbn_code: '9784422100517', jan_code: '1920011015000', released_at: '1999-10-20'},
    {title: '基礎から学ぶVue.js', auther: 'mio', isbn_code: '9784863542457', jan_code: '1923055034204', released_at: '2019-03-01'}
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

    @@test_books.each do |book|
      Book.create(book) unless Book.find_by(book)
    end

    @@test_borrows.each do |borrow|
      Borrow.create(borrow) unless Borrow.find_by(borrow)
    end

    @@test_returns.each do |return_data|
      Return.create(return_data) unless Return.find_by(return_data)
    end
  end
end
