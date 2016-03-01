# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times{User.create!(username: Faker::Internet.user_name, email: Faker::Internet.safe_email, password: "a")}

20.times{Post.create!(title: Faker::Hacker.say_something_smart, url: "http://google.com", user_id: rand(1..5))}

100.times{Comment.create!(content: Faker::Hipster.paragraph, user_id: rand(1..5), post_id: rand(1..20))}

100.times{PostVote.create!(post_id: rand(1..20), user_id: rand(1..5))}

500.times{CommentVote.create!(comment_id: rand(1..100), user_id: rand(1..5))}
