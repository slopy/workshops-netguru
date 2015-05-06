module ProductsHelper

	def user_is_product_owner?(product)
		if user_signed_in? and product.user==current_user
			true
		else
			false
		end
	end
end
