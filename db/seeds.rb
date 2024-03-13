# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Passage.destroy_all
Answer.destroy_all
Question.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

hank, bruce, matz, dhh = User.create!([{ name: 'Hank', email: 'hank@mail.com' },
                                       { name: 'Bruce', email: 'bruce@mail.com' },
                                       { name: 'Matz', email: 'matz@mail.com' },
                                       { name: 'David', email: 'david@mail.com' }])

frontend, backend = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }])

test = Test.create!(title: 'Simple', level: 1, category: frontend, author: dhh)
question = Question.create!({ body: '25 * 25?', test: test })
Answer.create!({ body: '635', correct: false, question: question })
Answer.create!({ body: '625', correct: true, question: question })
Answer.create!({ body: '645', correct: false, question: question })

question = Question.create!({ body: '2 + 2 * 2?', test: test })
Answer.create!({ body: '8', correct: false, question: question })
Answer.create!({ body: '6', correct: true, question: question })
Answer.create!({ body: '2', correct: false, question: question })

Passage.create!(test: test, user: hank, current_question: question)

%w[React Angular Vue].each do |theme|
  test = Test.create!(title: theme, level: 2, category: frontend, author: dhh)
  question = Question.create!({ body: 'Who is the inventor of the language?', test: test })
  Answer.create!({ body: 'Java', correct: false, question: question })
  Answer.create!({ body: 'script', correct: false, question: question })
  Answer.create!({ body: 'Cristopher Nolan', correct: true, question: question })
  Passage.create!(test: test, user: hank, current_question: question)

  question = Question.create!({ body: 'What is your name?', test: test })
  Answer.create!({ body: 'Batman', correct: false, question: question })
  Answer.create!({ body: 'Robin', correct: false, question: question })
  Answer.create!({ body: 'Joker', correct: true, question: question })
  Passage.create!(test: test, user: hank, current_question: question)
end

%w[Python PHP].each do |theme|
  test = Test.create!(title: theme, level: 3, category: backend, author: matz)
  question = Question.create!({ body: 'Who is the inventor of the language?', test: test })
  Answer.create!({ body: 'Petrov', correct: false, question: question })
  Answer.create!({ body: 'Ivanov', correct: false, question: question })
  Answer.create!({ body: 'Matz', correct: true, question: question })
  Passage.create!(test: test, user: bruce, current_question: question)

  question = Question.create!({ body: 'When the language was created?', test: test })
  Answer.create!({ body: '1985', correct: false, question: question })
  Answer.create!({ body: '1995', correct: true, question: question })
  Answer.create!({ body: '2005', correct: false, question: question })
  Passage.create!(test: test, user: bruce, current_question: question)

  question = Question.create!({ body: 'How create an object?', test: test })
  Answer.create!({ body: 'Object.new', correct: true, question: question })
  Answer.create!({ body: 'Class.new', correct: false, question: question })
  Passage.create!(test: test, user: bruce, current_question: question)
end

test = Test.create!(title: 'Ruby', level: 5, category: backend, author: matz)
question = Question.create!({ body: 'Who is the inventor of the language?', test: test })
Answer.create!({ body: 'Petrov', correct: false, question: question })
Answer.create!({ body: 'Ivanov', correct: false, question: question })
Answer.create!({ body: 'Matz', correct: true, question: question })
Passage.create!(test: test, user: bruce, current_question: question)

question = Question.create!({ body: 'When the language was created?', test: test })
Answer.create!({ body: '1985', correct: false, question: question })
Answer.create!({ body: '1995', correct: true, question: question })
Answer.create!({ body: '2005', correct: false, question: question })
Passage.create!(test: test, user: bruce, current_question: question)

question = Question.create!({ body: 'How create an object?', test: test })
Answer.create!({ body: 'Object.new', correct: true, question: question })
Answer.create!({ body: 'Class.new', correct: false, question: question })
Passage.create!(test: test, user: bruce, current_question: question)
