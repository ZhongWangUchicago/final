# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.delete_all
Customer.delete_all
Reservation.delete_all
Picture.delete_all
Comment.delete_all

john  = Customer.create({ first_name: 'John', last_name: 'Doe' })
smith = Customer.create({ first_name: 'Doe', last_name: 'Smith' })

rest = Restaurant.create({ name: "Jimmy Johns", description: "Sandwich!" })

Reservation.create([
    { restaurant_id: rest.id, customer_id_id: john.id }, 
    { restaurant_id: rest.id, customer_id_id: smith.id }
])