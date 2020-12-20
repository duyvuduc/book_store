class OrderDetail < ApplicationRecord
  belongs_to :book
  belongs_to :order

  validates :number, :book_id, presence: true
end
