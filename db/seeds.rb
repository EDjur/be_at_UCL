# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

DatabaseCleaner.clean_with :truncation

Event.create([
                 {title: 'Web development is rad guest lecture', text: "Guest lecture by Mike on web development best practices.", street: "Gower Street", street_number: "1", city: "London", start_date: DateTime.strptime("2016-12-06 18:30:00", "%Y-%m-%d %H:%M:%S"), end_date: DateTime.strptime("2016-12-06 19:30:00", "%Y-%m-%d %H:%M:%S"), available_tickets: 0, start_time: DateTime.strptime("2016-11-06 13:14:00", "%Y-%m-%d %H:%M:%S"), end_time: DateTime.strptime("2016-11-06 13:14:00", "%Y-%m-%d %H:%M:%S"), host_user_id: 1, tickets_sold: 0},
                 {title: 'SoM Christmas Ball', text: "School of Management Society's Christmas Ball - exclusive to School of Management students", street: "Stables Market, Chalk Farm Rd", street_number: "", city: "London", start_date: DateTime.strptime("2016-12-12 20:00:00", "%Y-%m-%d %H:%M:%S"), end_date: DateTime.strptime("2016-12-12 22:00:00", "%Y-%m-%d %H:%M:%S"), available_tickets: 80, start_time: DateTime.strptime("2016-12-12 20:00:00", "%Y-%m-%d %H:%M:%S"), end_time: DateTime.strptime("2016-12-12 22:00:00", "%Y-%m-%d %H:%M:%S"), host_user_id: 2, tickets_sold: 0},
                 {title: 'Hour of Code at UCL', text: "On 7th December, come along for an exciting intro to arguably one of the most exciting fields of technology, security, in our Hour of Code event at UCL!", street: "Gower Street", street_number: "58", city: "London", start_date: DateTime.strptime("2016-12-07 18:00:00", "%Y-%m-%d %H:%M:%S"), end_date: DateTime.strptime("2016-12-07 20:00:00", "%Y-%m-%d %H:%M:%S"), available_tickets: 65, start_time: DateTime.strptime("2016-12-07 18:00:00", "%Y-%m-%d %H:%M:%S"), end_time: DateTime.strptime("2016-12-07 20:00:00", "%Y-%m-%d %H:%M:%S"), host_user_id: 1, tickets_sold: 0},
                 {title: 'Tech & Tell', text: "We know that technology can be quite intimidating, so we’re running a Tech & Tell event where you get to present projects you’ve worked on and get feedback from people with similar technical minds. ", street: "Gower Street", street_number: "58", city: "London", start_date: DateTime.strptime("2016-12-02 00:00:00", "%Y-%m-%d %H:%M:%S"), end_date: DateTime.strptime("2016-12-02 00:00:00", "%Y-%m-%d %H:%M:%S"), available_tickets: 10, start_time: DateTime.strptime("2016-12-06 18:00:00", "%Y-%m-%d %H:%M:%S"), end_time: DateTime.strptime("2016-12-06 21:00:00", "%Y-%m-%d %H:%M:%S"), host_user_id: 1, tickets_sold: 0}])
