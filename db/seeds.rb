# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r1 = Role.create({ name: 'Regular', description: 'Can read only' })
r2 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })


u1 = User.create({ first_name: 'Sally',last_name:"Doe",middle_name: "S", dob:"DateTime.new(2009,9,1,17)", gender:"Female" ,title:"Mrs", age:26, ethinicity:"White",language:"English",email: 'sally@example.com', password: '123456', password_confirmation: '123456', role_id: r1.id })
u2 = User.create({ first_name: 'Admin',last_name:"Test",middle_name: "T", dob:"DateTime.new(2007,6,4,17)", gender:"Male" ,title:"Mr", age:28, ethinicity:"Asian",language:"English",email: 'test@test.com', password: '123456', password_confirmation: '123456', role_id: r2.id })