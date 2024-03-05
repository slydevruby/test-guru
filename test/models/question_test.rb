# frozen_string_literal: true

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'save not' do
    q = Question.new
    assert_not q.save
    assert_equal ['Вопрос: Пустое сообщение'], q.errors[:body]
    assert_equal ['Вопрос: не указан тест'], q.errors[:test]
  end

  test 'save not2' do
    q = Question.new(body: 'mybody')
    assert_not q.save
    assert_equal ['Вопрос: не указан тест'], q.errors[:test]
  end

  test 'save ok' do
    q = Question.new(body: 'mybody',
                     test: questions(:one).test)
    assert q.save
  end
end
