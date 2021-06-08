class OrderItem < ApplicationRecord
  #se crea modelo order_item ya que hay una relacion n a n entre product y order (rails g model OrderItem order:references product:references quantity:integer price:decimal) a agregan las columnas quantity y price
  belongs_to :order
  belongs_to :product
end
