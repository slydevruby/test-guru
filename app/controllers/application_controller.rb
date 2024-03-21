# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  after_action :store_action

  def store_action
    return unless request.get?

    if request.path != '/users/sign_in' &&
       request.path != '/users/sign_up' &&
       request.path != '/users/password/new' &&
       request.path != '/users/password/edit' &&
       request.path != '/users/confirmation' &&
       request.path != '/users/sign_out' &&
       !request.xhr? # don't store ajax calls
      store_location_for(:user, admin_tests_path)
    end
  end
end

# rubocop:enable Metrics/AbcSize
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/PerceivedComplexity
