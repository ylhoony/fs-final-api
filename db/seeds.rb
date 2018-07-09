# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([ { email: "no1@no.co", password: "nonono", password_confirmation: "nonono", first_name: "Brian", last_name: "Dolly"  },
                      { email: "no2@no.co", password: "nonono", password_confirmation: "nonono", first_name: "Lauren", last_name: "Jane" }
                      { email: "no3@no.co", password: "nonono", password_confirmation: "nonono", first_name: "Paul", last_name: "Trump" } ])

