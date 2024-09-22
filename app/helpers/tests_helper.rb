# frozen_string_literal: true

module TestsHelper
  def test_level(level)
    case level
    when 0..1
      "Beginner (#{level})"
    when 2..4
      "Intermediate (#{level})"
    else
      "Advanced (#{level})"
    end
  end
end
