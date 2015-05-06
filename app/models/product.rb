class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews, dependent: :destroy


 validates_presence_of	:title
 validates_presence_of	:description
 validates_presence_of	:price

 validates_format_of :price, :with => /\A[0-9]+.?\d{,2}\z/i
 validates :price, numericality: true

	def average_rating
		ratings=0.00
		i=0
		reviews.each do |review|
			ratings += review.rating
			i +=1
		end
		average=ratings/i

		average.nan? ? 0 : average

	end

end
