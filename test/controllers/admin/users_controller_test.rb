# frozen_string_literal: true

require 'test_helper'

# rubocop:disable Style/ClassAndModuleChildren

class Admin::UsersControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_users_index_url
    assert_response :success
  end
end

# rubocop:enable Style/ClassAndModuleChildren
