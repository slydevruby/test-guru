# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::BaseController < ApplicationController
  layout 'admin'

  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_path, alert: 'You are not authorized to view this page' unless current_user.is_a?(Admin)
  end
end
# rubocop:enable Style/ClassAndModuleChildren
