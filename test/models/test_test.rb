# frozen_string_literal: true

require 'test_helper'

class TestTest < ActiveSupport::TestCase
  test 'the truth' do
    t = Test.new
    assert_not t.save
  end
end
