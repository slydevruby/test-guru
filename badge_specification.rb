# frozen_string_literal: true

class BadgeSpecification
  def initialize(badge)
    @badge = badge
  end

  def satisfied_by?
    raise NotImplementedError, 'You must implement the satisfied_by? method'
  end
end

class TestSpecification < BadgeSpecification
  def satisfied_by?(passage)
    @badge.parameter == passage.test.id
  end
end

class LevelSpecification < BadgeSpecification
  def satisfied_by?(passage)
    (Test.by_level(@badge.parameter).count ==
      Passage.by_user(passage.user).by_level(@badge.parameter).passed.count)
  end
end

class CategorySpecification < BadgeSpecification
  def satisfied_by?(passage)
    category = Category.find(@badge.parameter)
    Passage.by_category_title(category.title).passed.by_user(passage.user).count ==
      Test.by_category(category).count
  end
end

SPEC = {
  'test' => TestSpecification,
  'level' => LevelSpecification,
  'category' => CategorySpecification
}.freeze

passage = Passage.first

Badge.find_each do |badge|
  spec = SPEC[badge.rule].new(badge)
  puts('add badge!!!!!!!') if spec.satisfied_by?(passage)
end
