# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#users
u1 = User.create({username: 'Bill'})
u2 = User.create({username: 'Frank'})
u3 = User.create({username: 'Carol'})

#polls
p1 = Poll.create({title: 'Favorite Color', author_id: u1.id})
p2 = Poll.create({title: 'Best Pizza Style', author_id: u1.id})
p3 = Poll.create({title: 'Best Twin Peaks: The Return Character', author_id: u2.id})
p4 = Poll.create({title: 'Best Misfits Song', author_id: u2.id})
p5 = Poll.create({title: '2020 Presidential Election', author_id: u3.id})

#questions
q1 = Question.create({text: 'What is your favorite shade of blue?', poll_id: p1.id})
q2 = Question.create({text: 'What is the best pizza crust style?', poll_id: p2.id})
q3 = Question.create({text: 'Which Cooper is the best?', poll_id: p3.id})
q4 = Question.create({text: 'Who is the better villian?', poll_id: p3.id})
q5 = Question.create({text: 'Which is the better Misfits song (pt1)?', poll_id: p4.id})
q6 = Question.create({text: 'Which is the better Misfits song (pt2)?', poll_id: p4.id})
q7 = Question.create({text: 'Who did you vote for in the 2020 election?', poll_id: p5.id})

#answer_choices
ac1 = AnswerChoice.create({text: 'Royal Blue', question_id: q1.id})
ac2 = AnswerChoice.create({text: 'Navy Blue', question_id: q1.id})
ac3 = AnswerChoice.create({text: 'Sky Blue', question_id: q1.id})
ac4 = AnswerChoice.create({text: 'Deep Dish', question_id: q2.id})
ac5 = AnswerChoice.create({text: 'Thin Crust', question_id: q2.id})
ac6 = AnswerChoice.create({text: 'NY Style', question_id: q2.id})
ac7 = AnswerChoice.create({text: 'Stuffed Crust', question_id: q2.id})
ac8 = AnswerChoice.create({text: 'Agent Dale Cooper', question_id: q3.id})
ac9 = AnswerChoice.create({text: 'Coop (evil Cooper)', question_id: q3.id})
ac10 = AnswerChoice.create({text: 'Dougie Jones', question_id: q3.id})
ac11 = AnswerChoice.create({text: 'Coop (evil Cooper)', question_id: q4.id})
ac12 = AnswerChoice.create({text: 'Bob', question_id: q4.id})
ac13 = AnswerChoice.create({text: 'Leland Palmer', question_id: q4.id})
ac14 = AnswerChoice.create({text: 'Windom Earle', question_id: q4.id})
ac15 = AnswerChoice.create({text: 'Die,Die My Darling', question_id: q5.id})
ac16 = AnswerChoice.create({text: 'Hollywood Babylon', question_id: q5.id})
ac17 = AnswerChoice.create({text: 'Last Caress', question_id: q6.id})
ac18 = AnswerChoice.create({text: 'Hybrid Moments', question_id: q6.id})
ac19 = AnswerChoice.create({text: 'Donald Trump', question_id: q7.id})
ac20 = AnswerChoice.create({text: 'Joe Biden', question_id: q7.id})
ac21 = AnswerChoice.create({text: 'Other/Third Party', question_id: q7.id})
ac22 = AnswerChoice.create({text: 'Undecided/No Vote', question_id: q7.id})

#responses
r1 = Response.create({user_id: u1.id, question_id: q3.id, answer_choice_id: ac10.id})
r2 = Response.create({user_id: u1.id, question_id: q4.id, answer_choice_id: ac14.id})
r3 = Response.create({user_id: u1.id, question_id: q7.id, answer_choice_id: ac22.id})
r4 = Response.create({user_id: u2.id, question_id: q1.id, answer_choice_id: ac3.id})
r5 = Response.create({user_id: u2.id, question_id: q2.id, answer_choice_id: ac7.id})
r6 = Response.create({user_id: u2.id, question_id: q7.id, answer_choice_id: ac20.id})
r7 = Response.create({user_id: u3.id, question_id: q1.id, answer_choice_id: ac1.id})
r8 = Response.create({user_id: u3.id, question_id: q2.id, answer_choice_id: ac4.id})
r9 = Response.create({user_id: u3.id, question_id: q3.id, answer_choice_id: ac8.id})
r10 = Response.create({user_id: u3.id, question_id: q4.id, answer_choice_id: ac12.id})
r11 = Response.create({user_id: u3.id, question_id: q5.id, answer_choice_id: ac16.id})
r12 = Response.create({user_id: u3.id, question_id: q6.id, answer_choice_id: ac18.id})
r13 = Response.create({user_id: u1.id, question_id: q5.id, answer_choice_id: ac16.id})
r14 = Response.create({user_id: u1.id, question_id: q6.id, answer_choice_id: ac17.id})
