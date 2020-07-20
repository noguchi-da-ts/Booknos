class RequestBookInfo

  def self.search(isbn_code = nil)
    @book = RakutenWebService::Books::Book.search(isbn: isbn_code) if isbn_code
    return @book.first
  end

end

# @book.first

# @params={
#   "limitedFlag"=>0, 
#   "authorKana"=>"キハシ,マサヒロ", 
#   "author"=>"きはしまさひろ", 
#   "subTitle"=>"実務で生かせる知識が、確実に身につく", 
#   "seriesNameKana"=>"インフォマティクス アンド アイデア", 
#   "title"=>"この一冊で全部わかるサーバーの基本", 
#   "subTitleKana"=>"ジツム デ イカセル チシキ ガ カクジツ ニ ミニツク", 
#   "itemCaption"=>"サーバーの種類や役割、運用、仮想化まで、実務に生かせる知識が確実に身につく。", 
#   "publisherName"=>"SBクリエイティブ", 
#   "listPrice"=>0, "isbn"=>"9784797386660", 
#   "largeImageUrl"=>"https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6660/9784797386660.jpg?_ex=200x200", 
#   "mediumImageUrl"=>"https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6660/9784797386660.jpg?_ex=120x120", 
#   "titleKana"=>"コノ イッサツ デ ゼンブ ワカル サーバー ノ キホン", 
#   "availability"=>"4", 
#   "postageFlag"=>2, 
#   "salesDate"=>"2016年03月30日頃", 
#   "contents"=>"", 
#   "smallImageUrl"=>"https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/6660/9784797386660.jpg?_ex=64x64", 
#   "discountPrice"=>0, 
#   "itemPrice"=>1848, 
#   "size"=>"単行本", 
#   "booksGenreId"=>"001012010001/001012010", 
#   "affiliateUrl"=>"", 
#   "seriesName"=>"Informatics＆IDEA", 
#   "reviewCount"=>4, 
#   "reviewAverage"=>"3.33", 
#   "discountRate"=>0, 
#   "chirayomiUrl"=>"", 
#   "itemUrl"=>"https://books.rakuten.co.jp/rb/13836892/"
# }
