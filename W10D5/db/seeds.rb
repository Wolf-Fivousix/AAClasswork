# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Todo.destroy_all

Todo.create(
  [{title: "Test1", body: "test1body",done: false} ,
  {title: "Test2", body: "test2body",done: false} ,
  {title: "Test3", body: "test3body",done: false} ,
  {title: "Test4", body: "test4body",done: true}]
)