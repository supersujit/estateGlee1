# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user = User.create!(email: 'first@example.com', password: 'password', password_confirmation: 'password')
40.times do
  property = Property.find_or_create_by!(title: "#{Faker::Mountain.name} House", address_line1: Faker::Address.secondary_address, address_line2: Faker::Address.street_address,
                             city: Faker::Address.city, zip: Faker::Address.zip, description: Faker::Lorem.paragraph(sentence_count: 9) , user_id: user.id,
                             picture_url: nil, created_at: Faker::Date.between(from: '2021-01-01', to: '2023-02-25'),
                             updated_at: Faker::Date.between(from: '2021-01-01', to: '2023-02-25'))
  property.status_updates.find_or_create_by!(status: Faker::Number.within(range: 0..4), user_id: user.id)
end
