class Test < ApplicationRecord
  def self.categories_by_title(title)
    joins('join categories on tests.category_id = categories.id')
      .where(categories: { title: title })
      .order(title: :desc)
      .pluck(:title)
  end

end
