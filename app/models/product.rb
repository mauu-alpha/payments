class Product < ApplicationRecord
  has_many :order_items, inverse_of: :order_item
end
