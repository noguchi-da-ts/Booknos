class Book < ApplicationRecord
  has_many :borrows

  def is_rentaled
    rentaled = Borrow.find_by(book_id: id, is_returned: false)
    rentaled ? true : false
  end

  def now_borrowers
    if is_rentaled
      borrower_ids = Borrow.where(book_id: id, is_returned: false).pluck(:user_id)
      bollowers = User.where(id: borrower_ids)
    else
      nil
    end
  end
end
