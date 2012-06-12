class LineItem < ActiveRecord::Base
 # The below line should probably be commented out because it doesnt make sense to be able to change line_items via mass-assignment post-creation.
 #  attr_accessible :cart_id, :product_id

 belongs_to :product
 belongs_to :cart
end
