# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

alan = User.create(name: 'Alan')
alan.create_website(url: 'https://kgoralski.gitbook.io/wiki/microservices')

sam = User.create(name: 'Sam')
sam.create_website(url: 'https://techcrunch.com/')

samantha = User.create(name: 'Samantha')
samantha.create_website(url: 'https://techcrunch.com/2020/07/01/bmw-wants-to-sell-you-subscriptions-to-your-cars-features/')

mike = User.create(name: 'Mike')
mike.create_website(url: 'https://www.infoq.com/news/2020/07/mandrel-graalvm/')

john = User.create(name: 'John')
john.create_website(url: 'https://www.nature.com/articles/d41586-020-01914-4')