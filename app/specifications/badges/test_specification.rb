# frozen_string_literal: true

module Badges
  class TestSpecification < BadgeSpecification
    def satisfied_by?(passage)
      @badge.parameter == passage.test.title
    end
  end
end
