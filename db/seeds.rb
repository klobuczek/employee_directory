# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[Employee, Position].each(&:delete_all)
bart = Employee.create!(first_name: 'Bart', last_name: 'Simpson')
homer = Employee.create!(first_name: 'Homer', last_name: 'Simpson')
monty = Employee.create!(first_name: 'Monty', last_name: 'Burns')

bart.positions.create!(title: 'Junior Engineer')
homer.positions.create!(title: 'Senior Engineer')
monty.positions.create!(title: 'Manager')
