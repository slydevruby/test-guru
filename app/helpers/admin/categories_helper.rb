# frozen_string_literal: true

class Admin
  module CategoriesHelper
    def category_helper(title)
      Category.joins(:tests).where(title:).count
    end
  end
end
