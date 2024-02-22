# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Result.destroy_all
Test.destroy_all
Category.destroy_all
User.destroy_all

%w[Frontend Backend Ruby Javascript].each do |title|
  Category.find_or_create_by(title: title)
end

%w[Matz John Hank Bruce].each do |user|
  User.create(name: user)
end

matz_id = User.find_by(name: 'Matz').id
hank_id = User.find_by(name: 'Hank').id
bruce_id = User.find_by(name: 'Bruce').id

ruby_id = Category.find_by(title: 'Ruby').id

level = 1
['Basics', 'Types of data', 'OOP', 'Iterators'].each do |theme|
  t = Test.create(title: theme, level:  level, category_id: ruby_id, author_id: matz_id)
  Result.create(test_id: t.id, user_id: hank_id, passed: true)
  Result.create(test_id: t.id, user_id: bruce_id, passed: false)
  level += 1
end

# User.find_by(name: 'Bruce').tests(1)
