class Order < ApplicationRecord
  belongs_to :user #para el carro de compra se crea el modelo order que esta relacionado a un usuario y tendra las columnas number, total, state
                   #luego crear usuarios de prueba en test/fixtures/users.yml y tbn en admin.yml
                   #una vez creados los usuarios de prueba se realiza el primer test/model/order_test.rb
  before_create :generate_number #se crea accion para realizar prueba(no olvidar que es necesario para que la prueba salga correcta ya que hasta el momento number esta vacio y no hay nada generando)
  
  #relacion con order_items
  has_many :order_items  #tiene muchos order_items
  has_many :products, through: :order_items #tiene muchos products a traves de order_items
  
  validates :number, uniqueness: true #validamos que el numero de orden sea unico
  
  def add_product(product_id, quantity) #el metodo recibe 2 argunemntos
    product = Product.find(product_id) #vamos a buscar el producto a traves del parametro product id  

    if product #si ese producto existe en la base de datos vamos a crear una orden 
      order_items.create(product_id: product.id, quantity: quantity, price: product.price) #product_id va a ser igual al id del producto que encontramos en la base de datos, }    end
    end                                                                                     #le pasamos la cantidad y el precio del producto
  end

  def generate_number #se implementa metodo para before create
    self.number = loop do #al atributo number le vamos a hacer una asignacion con loop y dependiendo de lo que encuentre el loop lo vamos a romper y asignar lo que encuentre al atributo number(loop recibe un bloque)
      rand_str = "PO#{Array.new(9){rand(9)}.split}" #creamos un string aleatorio va a partir con un prefijo de ej vamos a interpolar numeros de forma aleatoria (se crea un array de largo nueve y cada elemento generado va a ser un resultado del random de largo 9 lego lo concatenamos con el metodo split )
      break rand_str unless Order.exists?(number: rand_str) #con break salimos del loop a traves del random string  y vamos a preguntar si existe una orden con el numero a consultar con esto ya podemos ejecutar el test
    end
  end
end   

