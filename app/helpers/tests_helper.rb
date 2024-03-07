# frozen_string_literal: true

module TestsHelper
  def test_level(level)
    case level
    when 0..1
      'Beginner'
    when 2..4
      'Intermediate'
    else
      'Advanced'
    end
  end
end
