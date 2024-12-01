# frozen_string_literal: true

class BadgeSpecification
  def initialize(badge)
    @badge = badge
  end

  def satisfied_by?
    raise NotImplementedError, 'You must implement the satisfied_by? method'
  end
end
