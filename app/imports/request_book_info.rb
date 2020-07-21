# /confog/initializers/rakuten.rb でapp_idをread

class RequestBookInfo

  def self.search(isbn_code = nil)
    @book = RakutenWebService::Books::Book.search(isbn: isbn_code) if isbn_code
    return @book.first
  end

end
