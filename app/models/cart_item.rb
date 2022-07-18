class CartItem < ApplicationRecord
  belongs_to :customer
  has_many :item
end
