class Book < ApplicationRecord
  has_many :book_categories
  has_many :categories, through: :book_categories
  has_many :order_details
  has_many :orders, through: :order_details
end
