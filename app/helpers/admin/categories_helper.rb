# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

module Admin::CategoriesHelper
  def category_helper(title)
    Category.joins(:tests).where(title:).count
  end
end

# rubocop:enable Style/ClassAndModuleChildren
