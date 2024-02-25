# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Answer.destroy_all
Question.destroy_all
Result.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

hank, bruce, matz = User.create!([{ name: 'Hank' },
                                  { name: 'Bruce' },
                                  { name: 'Matz' }])

front, back = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }])

%w[React Angular Vue].each do |theme|
  t = Test.create!(title: theme, level:  2, category_id: front.id, author_id: matz.id)
  Result.create!(test_id: t.id, user_id: hank.id, passed: true)
end

%w[Python Ruby PHP].each do |theme|
  t = Test.create!(title: theme, level:  3, category_id: back.id, author_id: matz.id)
  q1 = Question.create!({ body: 'Who is the inventor of the language?', test_id: t.id })
  Answer.create!({ body: 'Petrov', correct: false, question_id: q1.id })
  Answer.create!({ body: 'Ivanov', correct: false, question_id: q1.id })
  Answer.create!({ body: 'Matz', correct: true, question_id: q1.id })

  q2 = Question.create!({ body: 'When the language was created?', test_id: t.id })
  Answer.create!({ body: '1985', correct: false, question_id: q2.id })
  Answer.create!({ body: '1995', correct: true, question_id: q2.id })
  Answer.create!({ body: '2005', correct: false, question_id: q2.id })

  q3 = Question.create!({ body: 'How create an object?', test_id: t.id })
  Answer.create!({ body: 'Object.new', correct: true, question_id: q3.id })
  Answer.create!({ body: 'Class.new', correct: false, question_id: q3.id })

  Result.create!(test_id: t.id, user_id: bruce.id, passed: true)

end
