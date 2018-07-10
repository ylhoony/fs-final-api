# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


users = User.create([ { email: "no1@no.co", password: "nonono", password_confirmation: "nonono", first_name: "Brian", last_name: "Dolly"  },
                      { email: "no2@no.co", password: "nonono", password_confirmation: "nonono", first_name: "Lauren", last_name: "Jane" },
                      { email: "no3@no.co", password: "nonono", password_confirmation: "nonono", first_name: "Paul", last_name: "Trump" } ])


countries = Country.create([{ name: "Canada", alpha2: "CA", alpha3: "CAN", numeric: "124", active: true },
                            { name: "Untied States", alpha2: "US", alpha3: "USA", numeric: "840", active: true },
                            { name: "South Korea", alpha2: "KR", alpha3: "KOR", numeric: "410", active: true },
                            { name: "Wonderland", alpha2: "WL", alpha3: "WDL", numeric: "999", active: false } ])

currencies = Currency.create([{ name: "Canadian Dollar", alpha3: "CAD", numeric: "124", active: true },
                              { name: "US Dollar", alpha3: "USD", numeric: "840", active: true },
                              { name: "South Korean Won", alpha3: "KRW", numeric: "410", active: true },
                              { name: "Wonderland Wonder", alpha3: "WDR", numeric: "999", active: false } ])
