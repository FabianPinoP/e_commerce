class Product < ApplicationRecord
    #relaciona n  a n con category (un producto puede pertenecer a varias categorias)
    has_and_belongs_to_many :categories
    #relacion con order_items
    has_many :order_items  #tiene muchos order_items
    has_many :orders, through: :order_items #tiene muchos orders a traves de order_items
end
