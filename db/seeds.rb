# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
40.times do
  Property.find_or_create_by(title: "#{Faker::Mountain.name} House", address_line1: Faker::Address.secondary_address, address_line2: Faker::Address.street_address,
                             city: Faker::Address.city, zip: Faker::Address.zip, description: Faker::Lorem.paragraph(sentence_count: 4) ,
                             picture_url: nil,
                             status: Faker::Number.within(range: 0..4), created_at: Faker::Date.between(from: '2021-01-01', to: '2023-02-25'),
                             updated_at: Faker::Date.between(from: '2021-01-01', to: '2023-02-25'))
end
