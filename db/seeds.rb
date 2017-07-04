# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

RecipeType.create(name: 'Entrada')
RecipeType.create(name: 'Principal')
RecipeType.create(name: 'Sobremesa')
RecipeType.create(name: 'Sopas e Caldos')

Cuisine.create(name: 'Brasileira')
Cuisine.create(name: 'Indiana')
Cuisine.create(name: 'Italiana')
Cuisine.create(name: 'Árabe')
