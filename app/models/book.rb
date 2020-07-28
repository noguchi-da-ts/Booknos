class Book < ApplicationRecord
  validates :title, presence: true, length: { in: 1..200, wrong_length: 'タイトルは1文字以上' }
  validates :isbn_code, presence: true, length: { in: 10..13, wrong_length: 'ISBNは10桁か13桁です'}

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
