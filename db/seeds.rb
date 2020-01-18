Product.destroy_all
Review.destroy_all

rand(50..125).times do |index|
  products = []
  products.push(Product.create!(name: Faker::Appliance.equipment,
    cost: Faker::Commerce.price,
    country_of_origin:  Faker::Address.country))
  products
  rand(3..15).times do |review|
    products.each do |product|
    Review.create! :author => Faker::TvShows::Simpsons.character, :content_body => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc congue faucibus urna at dignissim. Nunc gravida convallis ullamcorper. Donec sit.", :rating => rand(1..5),
                     :product_id => product.id
    end
  end
end

p "Database has been seeded with #{Product.count} products containing #{Review.count} reviews"