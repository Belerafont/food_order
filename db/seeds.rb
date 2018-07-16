# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
m = Menu.create!
dif1 = DishItems::First.create!(name: 'Soup', price: 10)
dif2 = DishItems::First.create!(name: 'Borsch', price: 12)
dif3 = DishItems::First.create!(name: 'Hodgepodge', price: 8)


dim1 = DishItems::Main.create!(name: 'Paste', price: 15)
dim2 = DishItems::Main.create!(name: 'Meat', price: 20)
dim3 = DishItems::Main.create!(name: 'Fish', price: 18)
dim4 = DishItems::Main.create!(name: 'Roll', price: 10)


did1 = DishItems::Drink.create!(name: 'Coca-Cola', price: 5)
did2 = DishItems::Drink.create!(name: 'Beer', price: 7)
did3 = DishItems::Drink.create!(name: 'Fanta', price: 5)

m.dish_items << [dif1, dif2, dif3, dim1, dim2, dim3, dim4, did1, did2, did3]