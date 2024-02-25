class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  has_many :questions
  has_many :results

  def self.categories_by_title(title)
    joins('join categories on tests.category_id = categories.id')
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end
end
