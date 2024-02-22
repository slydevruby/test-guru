# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Category.destroy_all

%w[Frontend Backend Ruby Javascript].each do |title|
  Category.find_or_create_by(title: title)
end

User.destroy_all
%w[Matz John Hank Bruce].each do |user|
  User.create(name: user)
end

matz_id = User.find_by(name: 'Matz').id

ruby_id = Category.find_by(title: 'Ruby').id

Test.destroy_all
['Basics', 'Types of data', 'OOP', 'Iterators'].each do |theme|
  Test.create(title: theme, level: 1, category_id: ruby_id, author_id: matz_id)
end
