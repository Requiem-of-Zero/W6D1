# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all
Question.destroy_all
AnswerChoice.destroy_all
Response.destroy_all

user1 = User.create!(username: 'Sam Wong')
user2 = User.create!(username: 'William Leung')

poll1 = Poll.create!(title: 'Power Rangers', author_id: user1.id)
poll2 = Poll.create!(title: 'Best Dim Sum', author_id: user2.id)

question1 = Question.create!(body: 'Which Power Ranger is the leader?', poll_id: poll1.id)
answer1 = AnswerChoice.create!(text: 'Red Ranger', question_id: question1.id)
answer2 = AnswerChoice.create!(text: 'Yellow Ranger', question_id: question1.id)
answer3 = AnswerChoice.create!(text: 'White Ranger', question_id: question1.id)

question2 = Question.create!(body: 'What is my favorite dim sum?', poll_id: poll2.id)
answer4 = AnswerChoice.create!(text: 'Ha Gao', question_id: question2.id)
answer5 = AnswerChoice.create!(text: 'Siu Mai', question_id: question2.id)
answer6 = AnswerChoice.create!(text: 'Ha Cherng', question_id: question2.id)

