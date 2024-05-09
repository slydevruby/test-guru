# frozen_string_literal: true

require 'test_helper'

class BadgesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get badges_index_url
    assert_response :success
  end

  test 'should get show' do
    get badges_show_url
    assert_response :success
  end

  test 'should get edit' do
    get badges_edit_url
    assert_response :success
  end

  test 'should get update' do
    get badges_update_url
    assert_response :success
  end
end
