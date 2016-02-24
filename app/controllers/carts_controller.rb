class CartsController < ApplicationController
	skip_before_action :validate_current_user, only: [:add_to_cart]
	before_action :check_logged_in
	
	def show
		@cart = Cart.includes(cart_items: :product).find(params[:id])
	end

	def add_to_cart
		cart_id = current_user.cart.id
		product_id = params[:product_id]
		begin
			current_user.cart.add_item(product_id)
			redirect_to cart_path(cart_id)
		rescue => e
			p "***add_to_cart***"
			p e.message
			p e.backtrace
		end
	end

	def remove_from_cart
		cart_id = current_user.cart.id
		product_id = params[:product_id]
		begin
			current_user.cart.remove_item(product_id)
			redirect_to cart_path(cart_id)
		rescue => e
			p "***remove_from_cart***"
			p e.message
			p e.backtrace
		end
	end

	private
	def validate_current_user
		unless current_user.id == params[:id].to_i
			flash[:error] = "You don't have access to that"
			redirect_to cart_path(current_user.id)
		end
	end
end