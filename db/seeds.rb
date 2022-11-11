# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: 'Jhon First', email: 'jhon@email.com',
                    password: '123456')
user2 = User.create(name: 'Jhon Second', email: 'jhon2@email.com',
                    password: '123456')
recipe1 = user1.recipes.create(name: 'Fried Chicken',
                               description: 'Nomad lifestyle is something really amazing, you should try it',
                               preparation_time: '10m', cooking_time: '10', public: true)
recipe2 = user2.recipes.create(name: 'Pasta Alfredo',
                               description: 'Nomad lifestyle is something really amazing, you should try it',
                               preparation_time: '15m', cooking_time: '20', public: true)
recipe3 = user2.recipes.create(name: 'Pizza',
                               description: 'Nomad lifestyle is something really amazing, you should try it',
                               preparation_time: '15m', cooking_time: '20', public: false)

food1 = user1.foods.create(name: 'Tomatoe',
                           measurement_unit: 'kg',
                           price: 15, quantity: '10')
food2 = user1.foods.create(name: 'Cheesse',
                           measurement_unit: 'kg',
                           price: 125, quantity: '1')
food3 = user1.foods.create(name: 'Milk',
                           measurement_unit: 'lts',
                           price: 25, quantity: '2')

recipe1_food1 = recipe1.recipe_foods.create(quantity: 2, food: food1)

recipe1_food2 = recipe1.recipe_foods.create(quantity: 2, food: food2)
