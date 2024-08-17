#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate

# bundle exec rails runner "User.find_by(email: 'sly.bart@gmail.com').update_attribute!(:type, 'Admin')"
# bundle exec rails runner "frontend, backend = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }])"
