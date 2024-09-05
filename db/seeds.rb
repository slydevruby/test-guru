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

# matz, dhh = User.create([
#                           { first_name: 'matz', email: 'matz@mail.com', password: 'matzpassword',
#                             password_confirmation: 'matzpassword'},
#                           { first_name: 'david', email: 'david@mail.com', password: 'davidpassword',
#                             password_confirmation: 'davidpassword' }
# ])
matz = User.new(first_name: 'matz', email: 'matz@mail.com', password: 'matzpassword',
                password_confirmation: 'matzpassword');

matz.skip_confirmation!
matz.save!
matz.type = 'Admin'
matz.save!

dhh = User.new(first_name: 'dhh', email: 'dhh@mail.com', password: 'dhhpassword',
               password_confirmation: 'dhhpassword');

dhh.skip_confirmation!
dhh.save!
dhh.type = 'User'
dhh.save!




frontend, backend = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }])

test = Test.create!(title: 'Simple', level: 1, category: frontend, author: dhh)
question = Question.create!({ body: '25 * 25?', test: })
Answer.create!({ body: '635', correct: false, question: })
Answer.create!({ body: '625', correct: true, question: })
Answer.create!({ body: '645', correct: false, question: })

question = Question.create!({ body: '2 + 2 * 2?', test: })
Answer.create!({ body: '8', correct: false, question: })
Answer.create!({ body: '6', correct: true, question: })
Answer.create!({ body: '2', correct: false, question: })

%w[React Angular Vue].each do |theme|
  test = Test.create!(title: theme, level: 2, category: frontend, author: dhh)
  question = Question.create!({ body: 'Who is the inventor of the language?', test: })
  Answer.create!({ body: 'Java', correct: false, question: })
  Answer.create!({ body: 'script', correct: false, question: })
  Answer.create!({ body: 'Cristopher Nolan', correct: true, question: })

  question = Question.create!({ body: 'What is your name?', test: })
  Answer.create!({ body: 'Batman', correct: false, question: })
  Answer.create!({ body: 'Robin', correct: false, question: })
  Answer.create!({ body: 'Joker', correct: true, question: })
end

%w[Python PHP].each do |theme|
  test = Test.create!(title: theme, level: 3, category: backend, author: matz)
  question = Question.create!({ body: 'Who is the inventor of the language?', test: })
  Answer.create!({ body: 'Petrov', correct: false, question: })
  Answer.create!({ body: 'Ivanov', correct: false, question: })
  Answer.create!({ body: 'Matz', correct: true, question: })

  question = Question.create!({ body: 'When the language was created?', test: })
  Answer.create!({ body: '1985', correct: false, question: })
  Answer.create!({ body: '1995', correct: true, question: })
  Answer.create!({ body: '2005', correct: false, question: })

  question = Question.create!({ body: 'How create an object?', test: })
  Answer.create!({ body: 'Object.new', correct: true, question: })
  Answer.create!({ body: 'Class.new', correct: false, question: })
end

test = Test.create!(title: 'Ruby', level: 5, category: backend, author: matz)
question = Question.create!({ body: 'Who is the inventor of the language?', test: })
Answer.create!({ body: 'Petrov', correct: false, question: })
Answer.create!({ body: 'Ivanov', correct: false, question: })
Answer.create!({ body: 'Matz', correct: true, question: })

question = Question.create!({ body: 'When the language was created?', test: })
Answer.create!({ body: '1985', correct: false, question: })
Answer.create!({ body: '1995', correct: true, question: })
Answer.create!({ body: '2005', correct: false, question: })

question = Question.create!({ body: 'How create an object?', test: })
Answer.create!({ body: 'Object.new', correct: true, question: })
Answer.create!({ body: 'Class.new', correct: false, question: })



Rule.create!(title: 'FrontRule', category: frontend)
Rule.create!(title: 'BackRule', category: backend)
