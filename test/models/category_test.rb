# frozen_string_literal: true

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  test 'should not be saved' do
    c = Category.new
    assert_not c.save, 'Did not save without a title'
  end

  test 'should be saved' do
    c = Category.new(title: categories(:fullstack).title)
    assert c.save
  end
end
