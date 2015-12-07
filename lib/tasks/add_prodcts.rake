task :add_product => :environment do
  (1..100).each do |line|
    Product.create({
      name: "product-#{line}",
      price: line
    })
  end
end