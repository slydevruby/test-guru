# frozen_string_literal: true

class Award < ApplicationRecord
  belongs_to :user
  belongs_to :badge

  def self.give(user, test)
    Badge.find_each do |badge|
      case badge.rule
      when 'category'
        Award.create_award(badge, user) if assign_category?(badge, user)
      when 'test'
        Award.create_award(badge, user) if assign_test?(badge, test)
      when 'level'
        Award.create_award(badge, user) if assign_level?(badge, user, test)
      end
    end
  end

  def self.create_award(badge, user)
    if exists?({ badge:, user: })
      find_by({ badge:, user:  }).increment!(:count)
    else
      create!(user:, badge:, count: 1)
    end
  end

  def self.assign_category?(badge, user)
    category = Category.find(badge.parameter)
    Passage.by_category_title(category.title).passed.by_user(user).count ==
      Test.by_category(category).count
  end

  def self.assign_test?(badge, test)
    (badge.parameter == test.id)
  end

  def self.assign_level?(badge, user, test)
    return false if badge.parameter != test.level

    (Test.by_level(badge.parameter).count ==
       Passage.by_user(user).by_level(badge.parameter).passed.count)
  end

  private_class_method :assign_category?, :assign_test?, :assign_level?
end
