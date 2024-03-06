# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'should not save user without title' do
    user = User.new
    assert_not user.save
    assert_equal ['Пустое имя'], user.errors[:name]
  end

  test 'should not save user with title, without email' do
    user = User.new(name: users(:clark).name)
    assert_not user.save
    assert_equal ['Пустая почта'], user.errors[:email]
  end

  test 'should not save user with unique email' do
    user = User.new(
      name: 'somebody',
      email: users(:joe).email
      # email: 'one1@mail.zet'
    )
    assert_not user.save
    assert_equal ['Почта уже используется'], user.errors[:email]
  end
end
