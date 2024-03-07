# frozen_string_literal: true

module QuestionsHelper
  def question_header(question)
    case question.new_record?
    when true
      "Create New #{@question.test.title} Question"
    when false
      "Edit #{@question.test.title} Question"
    end
  end
end
