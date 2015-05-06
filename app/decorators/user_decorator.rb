class UserDecorator < Draper::Decorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def reviews_count
  	object.reviews.count
  end

  def reviews_percent_in_total
  	count=(object.reviews.count.to_f / Review.all.count.to_f) * 100
  	count.to_i.to_s + "%"
  end

  def products_count
  	object.products.count
  end

  def products_percent_in_total
  	count=(object.products.count.to_f / Product.all.count.to_f) * 100
  	count.to_i.to_s + "%"
  end

end
