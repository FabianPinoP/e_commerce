class Category < ApplicationRecord
    #relaciona n a n con product (una categoria puede tener a varios productos)
    has_and_belongs_to_many :products
end
