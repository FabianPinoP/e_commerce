require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  test "generates a random number on create" do #test para generar un numero aleatorio en su atributo number
    user = users(:one) #vamos a pasar usuario le pasamos la clave del archivo yml de user(:one)
    order = Order.create(user_id: user.id) #a este usuario le vamos a generar una orden 
    assert_not order.number.nil? # nos vamos a asegurar que su atributo number no este vacio
  end #este codigo deberia fallar por que no hay nada en nuestro codigo que implemente este caso de prueba
      #ver modelo order

  test "number must be unique" do #test para probar que el numero sea unico
    user = users(:one)
    order = Order.create(user_id: user.id)
    dup_order = order.dup #vamos a duplicar esta orden 
    assert_not dup_order.valid? #vamos a probar que esta orden no sea valida 
                                #revisar que en el modelo order este validates :number, uniqueness: true
  end

  test 'adds products as order_items' do #para probar que nuestras ordenes agreguen productos (estos productos se van a agregar como order_items)
    user = users(:one)
    order = Order.create(user_id: user.id)
    product = products(:one) #vamos a pasar la clave del archivo products.yml (:one)
    quantity = 1 #vamos a probar con una unidad 
    order.add_product(product.id, quantity) # al metodo le pasamos un identificador del producto(product.id)
                                            #ver mmetodo en modelo de order.rb
    assert_equal(order.order_items.count, 1)#vamos a probar que la orden dentro de sus orden items encontremos al menos 1
  end 
end


