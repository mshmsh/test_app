include Faker 
include RandomData

#  categories populated 
Category.delete_all
10.times do 
category = Category.create(
	       :name => Random.companyname)
end
#  products populated 

Product.delete_all
r = %w{thumbnail.jpg thumbnail(1).jpg thumbnail(2).jpg thumbnail(3).jpg thumbnail(4).jpg thumbnail(5).jpg
thumbnail(6).jpg thumbnail(7).jpg thumbnail(8).jpg thumbnail(9).jpg thumbnail(10).jpg}
50.times do
product = Product.create( 
	      :title => Commerce.product_name,
	      :price=> Commerce.price.to_d,
	      :description=> Lorem.paragraph,
	      :category_id => Random.number(1..6),
	      :image_url => r.sample)
end