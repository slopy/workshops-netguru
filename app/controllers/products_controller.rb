class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :if_not_product_owner_or_admin_redirect, only: [:edit, :update]

  expose(:category)
  expose(:products)
  expose(:product)
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)
  expose_decorated(:product)

  def index
  end

  def show
  end

  def new
  end

  def edit 
  end

  def create
    self.product = Product.new(product_params)
    self.product.user=current_user
    if product.save 
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
      self.product.assign_attributes(product_params)
      if self.product.valid?
        self.product.update(product_params)
        redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
      else
        redirect_to category_product_url(category, product)
      end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def if_not_product_owner_or_admin_redirect
    unless self.product.user==current_user or current_user.admin?
      redirect_to(category_product_url(self.category, self.product))
      flash[:error] = 'You are not allowed to edit this product.'
    end
  end

  def product_owner?
    if self.product.user==current_user  
      true
    else
      false
    end
  end
  
end
