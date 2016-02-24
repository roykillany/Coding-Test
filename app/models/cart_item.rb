class CartItem < ActiveRecord::Base
	validates :cart_id, :product_id, presence: true

	belongs_to :cart
	belongs_to :product
end