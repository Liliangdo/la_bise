# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(first_name: "Lilian", last_name: "Garrido", birth_date: "13/10/1995", address: "Bordeaux", gender: "male", email: "lili@lewagon.org", phone_number: "555-550", description: "Bonjour je m'appelle Lilian et je suis le créateur de La Bise !", password: "123456789")
User.create(first_name: "Laurianne", last_name: "Gerin", birth_date: "22/04/1992", address: "Bordeaux", gender: "female", email: "lolo@lewagon.org", phone_number: "555-551", description: "Bonjour je m'appelle Laurianne et j'aime le raisin !", password: "123456789")
User.create(first_name: "Marc", last_name: "Desrosiers", birth_date: "01/11/1972", address: "Angoulême", gender: "male", email: "marco@lewagon.org", phone_number: "555-552", description: "Bonjour je m'appelle Marc et j'ai remporté un Iron Man !!!", password: "123456789")
User.create(first_name: "Sébastien", last_name: "Carnélos", birth_date: "19/10/1983", address: "Bordeaux", gender: "male", email: "seb@lewagon.org", phone_number: "555-553", description: "Bonjour je m'appelle Sébastien et je grimpe sur tout ce qui a des prises !", password: "123456789")

Event.create(user_id: 1, name: "Soirée d'inauguration La Bise", description: "Pour fêter la fin de notre projet, je vous invite à un brunch, chez moi.", price: 15, house_type: "Appartement", capacity: "8",created_at: Time.now, starting_at: Faker::Date.backward(14))
Event.create(user_id: 2, name: "Soirée raisin", description: "Dégusation de raisins (pas de vins) : colique assurée !", price: 8, house_type: "Appartement", capacity: "10",created_at: Time.now, starting_at: Faker::Date.forward(23))
Event.create(user_id: 3, name: "Soirée Iron Man", description: "Venez regarder la trilogie Iron Man dans mon home cinema. Je parle des trois dernières courses, pas des films !", price: 5, house_type: "Maison", capacity: "7",created_at: Time.now, starting_at: Faker::Date.forward(23))
Event.create(user_id: 4, name: "Soirée grimpe", description: "Petite initiation au block, dans mon garage.", price: 3, house_type:"Garage", capacity: "10",created_at: Time.now, starting_at: Faker::Date.backward(14))

Reservation.create(user_id: 2, event_id: 1)
Reservation.create(user_id: 3, event_id: 1)
Reservation.create(user_id: 4, event_id: 1)
Reservation.create(user_id: 3, event_id: 2)
Reservation.create(user_id: 1, event_id: 3)
Reservation.create(user_id: 2, event_id: 4)
Reservation.create(user_id: 3, event_id: 4)

Review.create(event_id: 1, user_id: 2, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
Review.create(event_id: 1, user_id: 3, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
Review.create(event_id: 1, user_id: 4, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
Review.create(event_id: 2, user_id: 3, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
Review.create(event_id: 3, user_id: 1, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
Review.create(event_id: 4, user_id: 2, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
Review.create(event_id: 4, user_id: 3, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))

Message.create(content: Faker::Lorem.sentence, event_id: 1, user_id: 2)
Message.create(content: Faker::Lorem.sentence, event_id: 1, user_id: 4)
Message.create(content: Faker::Lorem.sentence, event_id: 3, user_id: 1)
Message.create(content: Faker::Lorem.sentence, event_id: 4, user_id: 3)
