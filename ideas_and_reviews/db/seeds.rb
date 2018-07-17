# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PASSWORD = "moral"

Review.delete_all
Idea.delete_all
User.delete_all

associate_user = User.create(
  first_name: "saritha",
  last_name: "polisetty",
  email: "sp@gmail.com",
  password: PASSWORD,
  admin: true
)

10.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name

  User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
    password: PASSWORD,
  )
end

users = User.all

puts Cowsay.say "Created #{users.count} users", :tux

50.times do
  i = Idea.create(
    title: Faker::Hacker.noun,
    description: Faker::Hacker.say_something_smart,
    user: users.sample

  )
  if i.valid?
    rand(0..10).times do
      Review.create(
        description: Faker::Matz.quote,
        idea: i,
        user: users.sample

      )
    end
  end
end

ideas = Idea.all
reviews = Review.all

puts "Created #{Idea.count} Ideas"
puts "Reviewed #{Review.count} Reviews"

puts Cowsay.say("Created #{ideas.count} ideas", :elephant)
puts Cowsay.say("Reviewed #{reviews.count} reviews", :sheep)
