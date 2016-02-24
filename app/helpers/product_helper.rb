module ProductHelper
	def id(product)
		product.id if product && product.id.present?
	end

	def name_and_model(product)
		if product && product.name.present? && product.model.present?
			"#{product.name} <i>#{product.model}</i>".html_safe
		end
	end

	def brand(product)
		product.brand if product && product.brand.present?
	end

	def name(product)
		product.name if product && product.name.present?
	end

	def model(product)
		product.model if product && product.model.present?
	end

	def sku(product)
		product.sku if product && product.sku.present?
	end

	def price(product)
		"$#{product.price}" if product && product.price.present?
	end

	def desc(product)
		product.desc if product && product.desc.present?
	end
end