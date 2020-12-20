class Order < ApplicationRecord
  has_many :order_details
  has_many :books, through: :order_details

  accepts_nested_attributes_for :order_details, allow_destroy: true

  validates :address, :customer_name, :phone_number, presence: true
  validates :total, numericality: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
