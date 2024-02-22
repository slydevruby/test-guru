class Test < ApplicationRecord
  def self.names(cat_name)
    res = Test.where(category_id: Category.find_by(title: cat_name).id)
    return unless res

    res.order(title: :desc).pluck(:title)
  end
end
