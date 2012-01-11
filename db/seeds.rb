# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

myTodos = TodoList.create(name: 'My Todos')
2.times do |i|
  TodoItem.create(name: "Item name", description: "Item description", priority: i+1, todo_list_id: myTodos.id)
end

yourTodos = TodoList.create(name: 'Your Todos')
10.times do |i|
  TodoItem.create(name: "Item name", description: "Item description", priority: i+1, todo_list_id: yourTodos.id)
end
