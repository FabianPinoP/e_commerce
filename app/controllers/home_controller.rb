class HomeController < ApplicationController

  #creamos el controlador home y en su index vamos a mostrar nuestro catalogo
  def index
    @products = Product.all #en esta instancia vamos a llamar a todos nuestros productos
  end
end
