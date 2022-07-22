class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { payment_waiting: 0, payment_confirm: 1, making: 2, prepare_shipping: 3, shipping_out: 4 }

  belongs_to :customer
  has_many :order_items

  validates :address, presence: true
  validates :name, presence: true
  validates :postcode, presence: true



end
