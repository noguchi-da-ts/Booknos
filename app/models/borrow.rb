class Borrow < ApplicationRecord
  belongs_to :book
  belongs_to :user
  has_one :return, :dependent => :destroy

  validates :book_id, presence: true
  validates :user_id, presence: true
end
