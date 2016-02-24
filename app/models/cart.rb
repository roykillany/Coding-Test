class Cart < ActiveRecord::Base
	validates :user_id, presence: true

	belongs_to :user
	has_many :cart_items
	has_many :products, through: :cart_items

	def add_item(product_id)
		cart_item = CartItem.new({
				cart_id: self.id,
				product_id: product_id
			})
		cart_item.save!
	end

	def remove_item(product_id)
		cart_item = CartItem.find_by({
					cart_id: self.id,
					product_id: product_id
				})
		cart_item.destroy!
	end
end