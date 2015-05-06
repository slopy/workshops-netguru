module UsersHelper

	def reviews_total_amount
		Review.all.count
	end

	def products_total_amount
		Product.all.count
	end

end
