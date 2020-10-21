# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Service.create(service_type: "Quick Service", allocated_time: "3")
Service.create(service_type: "Full Service", allocated_time: "6")
Service.create(service_type: "Other", allocated_time: "8")
