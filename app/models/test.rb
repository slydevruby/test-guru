class Test < ApplicationRecord
  def self.categories_by_title(title)
    Test.joins("join categories on tests.category_id = categories.id where categories.title
= '#{title}' order by tests.title desc").pluck(:title)
  end
end
