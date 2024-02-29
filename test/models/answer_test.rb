require 'test_helper'

class AnswerTest < ActiveSupport::TestCase
  test "the truth" do
     a = Answer.new(body: 'body',
      correct: false,
      question: answers(:first).question
      )
     assert_not a.save
  end
end
