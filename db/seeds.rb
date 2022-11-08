# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!(name: 'Tomory', email: 'tomory@email.com', password: '123456')
user2 = User.create!(name: 'Tomas', email: 'tomas@email.com', password: '123456')

food = user.foods.create(name: 'Apple', measurement_unit: 'unit',
                         price: 50, quantity: 2)

recipe = user.recipes.create(name: 'Apple Cake', preparation_time: '10m',
                             cooking_time: '10m', description: 'This is a easy recipe to follow', public: false)
recipe = user2.recipes.create(name: 'Cake', preparation_time: '10m',
                              cooking_time: '10m', description: 'This is a easy recipe to follow', public: false)
