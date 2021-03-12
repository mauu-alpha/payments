class Order < ApplicationRecord
  belongs_to :user, inverse_of: :orders
  has_many :order_items, inverse_of: :order
end
