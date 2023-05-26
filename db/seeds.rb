# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

department1 = Department.create!(name: "IT", floor: 2)
department2 = Department.create!(name: "Sales", floor: 3)
employee1 = department1.employees.create!(name: "Jolene", level: 7)
employee2 = department1.employees.create!(name: "Simon", level: 5)
employee3 = department2.employees.create!(name: "Brett", level: 6)
employee4 = department2.employees.create!(name: "Jana", level: 2)
