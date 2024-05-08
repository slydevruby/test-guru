User.find_by(email: 'sly.bart@gmail.com').update_attribute!(:type, 'Admin')

['Frontend', 'Backend'].each do |category_title|
  Category.find_or_create_by!(title: category_title)
end
