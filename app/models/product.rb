class Product < ActiveRecord::Base
	validates :name, :brand, :model, :price, :desc, :sku, presence: true

	has_many :cart_items
end