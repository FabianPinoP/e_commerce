# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#le pasamos al seed los archivos que creamos en la ruta db/seed y le pasamos todos los archivos de extension .rb con sort los vamos a ordenar alfabeticamente y por cada uno de esos vamos a cargar el seed 
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }