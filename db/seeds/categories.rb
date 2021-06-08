Category.destroy_all #destruimos las categorias para ejecutar archivo y no duplicar las ya existentes

categories = ['Smartphones', 'Shoes', 'Accesories'] #array de categorias    

categories.each do |category|   #por cada una de estas vamos a crear una categoria
    Category.create(name: category)
end