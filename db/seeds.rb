# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r1 = Role.create({ name: 'Regular', description: 'Can read only' })
r2 = Role.create({ name: 'Admin', description: 'Can perform any CRUD operation on any resource' })


u1 = User.create({ first_name: 'Zakwan',last_name:"Bhaiyat",middle_name: "S", dob:DateTime.new(1993,03,07), gender:"Male" ,title:"Mr", age:28, ethinicity:"Asian",language:"English",email: 'zakwan_bhaiyat@yahoo.com', password: '123456', password_confirmation: '123456', primary_phone_type: "Cell", primary_phone: "9293239120",primary_address_line_1:"743 Franklin St",primary_city:"Westbury",primary_state:"NY", primary_zip:"11590", primary_country: "USA",primary_address_type: "Home", role_id: r2.id })

u2 = User.create({ first_name: 'Test',last_name:"User", dob:DateTime.new(1993,03,07), gender:"Male" ,title:"Mr", age:28, ethinicity:"White",language:"English",email: 'test@test.com', password: '123456', password_confirmation: '123456', primary_phone_type: "Cell", primary_phone: "3476545654",primary_address_line_1:"835 Brush hollow rd",primary_city:"Westbury",primary_state:"NY", primary_zip:"11590", primary_country: "USA",primary_address_type: "Home", role_id: r1.id })

u3 = User.create({ first_name: 'Admin',last_name:"User", dob:DateTime.new(1983,08,17), gender:"Male" ,title:"Mr", age:29, ethinicity:"White",language:"English",email: 'admin@test.com', password: '123456', password_confirmation: '123456', primary_phone_type: "Cell", primary_phone: "3459877654",primary_address_line_1:"90-11 35th Ave",primary_city:"Flushing",primary_state:"NY", primary_zip:"11372", primary_country: "USA",primary_address_type: "Home", role_id: r2.id })
