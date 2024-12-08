# frozen_string_literal: true

module Badges
  class CategorySpecification < BadgeSpecification
    def satisfied_by?(passage)
      category = Category.find_by(title: @badge.parameter)
      Passage.by_category_title(category.title).passed.by_user(passage.user).count ==
        Test.by_category(category).count
    end
  end
end
