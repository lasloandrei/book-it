# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#User.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
#Contact.create!(first_name: 'Laslo', last_name: 'Andrei', phone_number: '0758878747', email: 'dlgoe@yahoo.com')
DiningTable.create!(uid: 1, seat: 6, zone_id: 1)
Zone.create!(name: 'Radioteca')    
Reservation.create!(contact_id: 3, dining_table_id: 1, date: '2015-06-18')	
