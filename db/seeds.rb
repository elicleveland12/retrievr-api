# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(name: "Greg", email: "123@test.com", password: "123", phone: "1234567890", location: "New York")
Pet.create(name: 'Margot', breed: "Australian Shephard", birthdate: "01/05/2019", user_id: 1, missing: false, color_primary: "Tricolor")



p "data populated"
