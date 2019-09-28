# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Cat.destroy_all

cat1 = Cat.create!(birth_date: "2019/01/20", color: "Black", name: "Mimi", sex: "F", description: "Persian Cat")
cat2 = Cat.create!(birth_date: "2018/04/20", color: "Red", name: "Wolf", sex: "M", description: "Wild Cat")
cat3 = Cat.create!(birth_date: "2017/03/20", color: "Yellow", name: "Alissa", sex: "F", description: "Black Cat")
cat4 = Cat.create!(birth_date: "2016/02/20", color: "Blue", name: "Alvin", sex: "M", description: "New York Cat")
