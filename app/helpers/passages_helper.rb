# frozen_string_literal: true

module PassagesHelper
  def pass_help
    (@passage.current_no.to_f / @passage.test.questions.count) * 100
  end
end
