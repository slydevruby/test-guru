# frozen_string_literal: true

module QuestionsHelper
  def question_header
    case action_name
    when 'new'
      "Create New #{@question.test.title} Question"
    when 'edit'
      "Edit #{@question.test.title} Question"
    end
  end
end
