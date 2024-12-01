# frozen_string_literal: true

module Badges
  class LevelSpecification < BadgeSpecification
    def satisfied_by?(passage)
      (Test.by_level(@badge.parameter).count ==
        Passage.by_user(passage.user).by_level(@badge.parameter).passed.count)
    end
  end
end
