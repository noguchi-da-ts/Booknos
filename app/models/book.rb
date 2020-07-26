class Book < ApplicationRecord
  has_many :borrows

  def is_rentaled
    rentaled = Borrow.find_by(book_id: id, is_returned: false)
    rentaled ? true : false
  end
end
