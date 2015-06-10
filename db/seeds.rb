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
Reviewer.delete_all

john  = Customer.create({
    first_name: 'John',
    last_name:  'Smith',
    password:   '1',
    email:      '1@1.com'
})
david = Customer.create({
    first_name: 'David',
    last_name:  'Bill',
    password:   '2',
    email:      '2@1.com'
})

restaurant1 = Restaurant.create({
    name: "Jimmy Johns",
    description: "Sandwichs! Sandwichs! Sandwichs!",
})

restaurant2 = Restaurant.create({
    name: "Starbucks",
    description: "Coffee! Coffee! Coffee!",
})


reviewers = Reviewer.create([
    { restaurant_id: restaurant1.id, customer_id: john.id, admin: true }, 
    { restaurant_id: restaurant1.id, customer_id: david.id, admin: true },

    { restaurant_id: restaurant2.id, customer_id: john.id, admin: true },
    { restaurant_id: restaurant2.id, customer_id: david.id, admin: false },
])

reviewers.each do |reviewer|
    Reservation.create({
        reviewer_id: reviewer.id,
        title: "Reservation #{reviewer.customer.first_name}",
        time_posted: DateTime.now,
        content: "Try once."
    })
end

picture = Picture.create({
    reviewer_id: reviewers[0].id,
    time_posted: DateTime.now,
    file_location: Rails.root.join('public', 'uploads', '1.jpg')
})

Comment.create({
    customer_id: john.id,
    picture_id: picture.id,
    time_posted: DateTime.now,
    content: "Pretty good!",
})
