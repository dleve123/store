class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy
  # Read: a cart has many line_items (objects that reperent the price of product at time of selection.
  # dependent: :destroy => if a cart is destroyed, then all the line items in the cart are destroted also.

end
