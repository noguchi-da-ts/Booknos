# /confog/initializers/rakuten.rbにapiキーを格納する

# RakutenWebService.configure do |c|
#   # (必須) アプリケーションID
#   c.application_id = '************'
# end

class RequestBookInfo

  def self.search(isbn_code = nil)
    @book = RakutenWebService::Books::Book.search(isbn: isbn_code) if isbn_code
    return @book.first
  end

end
