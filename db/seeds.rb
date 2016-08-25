# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ActiveRecord::Base.logger = Logger.new(STDOUT)


Review.destroy_all
Message.destroy_all
Reservation.destroy_all
Event.destroy_all
User.destroy_all


puts "User seed begin"

10.times do
  User.create(
    first_name: Faker::Name.first_name ,
    last_name: Faker::Name.last_name,
    birth_date: Faker::Date.between(90.days.ago, 18.days.ago),
    address: Faker::Address.street_address,
    gender: ["male", "female"].sample,
    email: Faker::Internet.email,
    phone_number: Faker::PhoneNumber.phone_number,
    description: Faker::Lorem.paragraph,
    password: Faker::Crypto.md5,
    )
  print "* "
end

puts " "
puts "User seed end"




puts "event begin"

15.times do
  Event.create(
    user_id: User.all.sample.id,
    name: Faker::Book.title,
    description: Faker::Lorem.paragraph,
    price: rand(1..10),
    house_type: Faker::Lorem.word,
    capacity: rand(1..15),
    starting_at: Faker::Time.forward(23, :evening),
    mood: Faker::Color.color_name,
    group_age: "rand(18..20)" + "->" + "rand(20..50)",
    option: ["Jardin", "Terrasse", "Piscine", "Garage", "Patio", "Home cinema", "Animaux", "Non-fumeur"].sample(2),
    address:["25 rue georges Pompidou 33600 pessac",
                            "rue de l'horloge 33600 pessac",
                            "31b avenue du général Leclerc 33600 pessac",
                            "72 Rue Fondaudège 33000 Bordeaux",
                            "115 Avenue Lucien Lerousseau, 33130 Bègles",
                            "262 cours gambetta 33400 Talence",
                            "Place Aristide Briand 33400 Talence",
                            "3 place de la République 33160 Saint Médard en Jalles",
                            "15 rue Nicolas Leblanc 33160",
                            "19 Rue Jean Jacques Rousseau 33000 Bordeaux",
                            "134 Rue François de Sourdis 33000 Bordeaux",
                            "37 Rue Esprit des Lois 33000 Bordeaux",
                            "79 Rue du Loup 33000 Bordeaux",
                            "168 Cours de l'Argonne 33000 Bordeaux",
                            "Miroir d'eau Place de la Bourse, 33000 Bordeaux"].sample
  )
  print "* "
end

puts " "
puts "event seed end"


puts "reservation begin"

10.times do
  reservation = Reservation.new(
    user_id: User.all.sample.id,
    event_id: Event.all.sample.id,
    ['accepted_at', 'refused_at', 'canceled_at'].sample.to_sym => Faker::Time.backward(5),
    guest: rand(1..5)
  )
  reservation.save
  print "* "
end

puts " "
puts "reservation seed end"

puts "review begin"

5.times do
  Review.create(
    event_id: Event.all.sample.id,
    user_id: User.all.sample.id,
    content: Faker::Lorem.paragraph,
    rating: Faker::Number.between(0, 5)
    )
  print "* "
end

puts " "
puts "review seed end"



puts "message begin"

5.times do

  users = User.all
  sender_id = users.sample.id
  recipient_id = users.reject { |user| user.id == sender_id }.sample.id


  Message.create(
    content: Faker::Lorem.sentence,
    event_id: Event.all.sample.id,
    sender_id: sender_id,
    recipient_id: recipient_id
    )
  print "* "
end

puts " "
puts "message seed end"

# User.create(first_name: "Lilian", last_name: "Garrido", birth_date: "13/10/1995", address: "Bordeaux", gender: "male", email: "lili@lewagon.org", phone_number: "555-550", description: "Bonjour je m'appelle Lilian et je suis le créateur de La Bise !", password: "123456789")
# User.create(first_name: "Laurianne", last_name: "Gerin", birth_date: "22/04/1992", address: "Bordeaux", gender: "female", email: "lolo@lewagon.org", phone_number: "555-551", description: "Bonjour je m'appelle Laurianne et j'aime le raisin !", password: "123456789")
# User.create(first_name: "Marc", last_name: "Desrosiers", birth_date: "01/11/1972", address: "Angoulême", gender: "male", email: "marco@lewagon.org", phone_number: "555-552", description: "Bonjour je m'appelle Marc et j'ai remporté un Iron Man !!!", password: "123456789")
# User.create(first_name: "Sébastien", last_name: "Carnélos", birth_date: "19/10/1983", address: "Bordeaux", gender: "male", email: "seb@lewagon.org", phone_number: "555-553", description: "Bonjour je m'appelle Sébastien et je grimpe sur tout ce qui a des prises !", password: "123456789")
#
#
# Event.create(user_id: 1, name: "Soirée d'inauguration La Bise", description: "Pour fêter la fin de notre projet, je vous invite à un brunch, chez moi.", price: 15, house_type: "Appartement", capacity: "8",created_at: Time.now, starting_at: Faker::Date.backward(14))
# Event.create(user_id: 2, name: "Soirée raisin", description: "Dégusation de raisins (pas de vins) : colique assurée !", price: 8, house_type: "Appartement", capacity: "10",created_at: Time.now, starting_at: Faker::Date.forward(23))
# Event.create(user_id: 3, name: "Soirée Iron Man", description: "Venez regarder la trilogie Iron Man dans mon home cinema. Je parle des trois dernières courses, pas des films !", price: 5, house_type: "Maison", capacity: "7",created_at: Time.now, starting_at: Faker::Date.forward(23))
# Event.create(user_id: 4, name: "Soirée grimpe", description: "Petite initiation au block, dans mon garage.", price: 3, house_type:"Garage", capacity: "10",created_at: Time.now, starting_at: Faker::Date.backward(14))
#
# Reservation.create(user_id: 2, event_id: 1)
# Reservation.create(user_id: 3, event_id: 1)
# Reservation.create(user_id: 4, event_id: 1)
# Reservation.create(user_id: 3, event_id: 2)
# Reservation.create(user_id: 1, event_id: 3)
# Reservation.create(user_id: 2, event_id: 4)
# Reservation.create(user_id: 3, event_id: 4)
#
# Review.create(event_id: 1, user_id: 2, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
# Review.create(event_id: 1, user_id: 3, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
# Review.create(event_id: 1, user_id: 4, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
# Review.create(event_id: 2, user_id: 3, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
# Review.create(event_id: 3, user_id: 1, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
# Review.create(event_id: 4, user_id: 2, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
# Review.create(event_id: 4, user_id: 3, content: Faker::Lorem.paragraph, rating: Faker::Number.between(0, 5))
#
# Message.create(content: Faker::Lorem.sentence, event_id: 1, user_id: 4)
# Message.create(content: Faker::Lorem.sentence, event_id: 3, user_id: 1)
# Message.create(content: Faker::Lorem.sentence, event_id: 4, user_id: 3)
