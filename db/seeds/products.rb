Product.destroy_all
Category.all.each do |category|
   4.times do |i| #por cada categoria vamos a hacer 4 productos 
    product_attributes = {
        name: "Producto_#{i}", #nombre a incrementar con el indice de la iteracion
        stock: rand(1..1000), #numero random entre 1 y 1000
        price: rand(1..10)*990, #valor entre 1 y 10 multiplicado por 990
        sku: ('A'..'Z').to_a.shuffle.first(10).join} #le pasamos un rango , con to_a lo pasamos a un array con shuffle lo vamos a revolver , con first tomamos los primeros 10 y los vamos a unir 
    Product.create(product_attributes).categories << category #creamos el producto con los atributos y en su categoria agregamos la category
   end
end