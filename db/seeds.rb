# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
user1=User.create :email=>"example1@example.com", :password=>"password123", :firstname=>"John", :lastname=>"Doe"
user2=User.create :email=>"example2@example.com", :password=>"password123", :firstname=>"Michael", :lastname=>"March"
User.create :email=>"example3@example.com", :password=>"password123", :firstname=>"Luke", :lastname=>"Skywalker"
User.create :email=>"example4@example.com", :password=>"password123", :firstname=>"Artur", :lastname=>"Dent"
User.create :email=>"example5@example.com", :password=>"password123", :firstname=>"Bilbo", :lastname=>"Baggins"

User.create :email=>"admin@example.com", :password=>"password123", :firstname=>"Admin", :lastname=>"Suradmin", :admin=>true

Category.delete_all
category=Category.create :name=>"Some fine stuff"
Category.create :name=>"Amazing things"
Category.create :name=>"Crazy elements"

Product.delete_all
(1..6).each do |n|
	product=Product.new :title=>"Magical number #{n}", :description=>"This is magical, #{user1.firstname} is the owner",
	 :price=>rand(100)

	product.category=category
	product.user=user1
	product.save!
end

(6..10).each do |n|
	product=Product.new :title=>"#{n} is meaning of life", :description=>"Dimension #{n}, #{user2.firstname} there he is!",
	 :price=>99.99

	product.category=category
	product.user=user2
	product.save!
end

product1=Product.first
product2=Product.last

Review.delete_all
(1..9).each do |n|
	review=Review.create :content=>"Review content #{n}", :rating=>rand(10)
	review.product=product1
	review.user=user1
	review.save!
end

(10..15).each do |n|
	review=Review.create :content=>"Review content #{n}", :rating=>rand(10)
	review.product=product2
	review.user=user2
	review.save!
end
