# frozen_string_literal: true

module BadgeService
  SPEC = {
    'test' => Badges::TestSpecification,
    'level' => Badges::LevelSpecification,
    'category' => Badges::CategorySpecification
  }.freeze

  def self.create_award(badge, user)
    if Award.exists?({ badge:, user: })
      Award.find_by({ badge:, user:  }).increment!(:count)
    else
      Award.create!(user:, badge:, count: 1)
    end
  end

  def self.call(passage)
    Badge.find_each do |badge|
      spec = SPEC[badge.rule].new(badge)
      create_award(badge, passage.user) if spec.satisfied_by?(passage)
    end
  end
end
