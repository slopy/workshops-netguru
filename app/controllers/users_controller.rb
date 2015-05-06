class UsersController < ApplicationController

expose_decorated(:user)
expose_decorated(:reviews)
expose(:products)

  def show
  	self.products=self.user.products.order(created_at: :desc).take(3)
  	self.reviews=self.user.reviews.order(created_at: :desc).take(5)
  end
end
