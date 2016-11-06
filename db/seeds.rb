# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.clean_with :truncation

Event.create([
                 {title: 'Event 1', text: "This is a test event", street: "Test Street", street_number: "1", city: "London"},
                 {title: 'Event 2', text: "This is a test event", street: "Test Street", street_number: "2", city: "London"},
                 {title: 'Event 3', text: "This is a test event", street: "Test Street", street_number: "3", city: "London"},
                 {title: 'Event 4', text: "This is a test event", street: "Test Street", street_number: "4", city: "London"}])