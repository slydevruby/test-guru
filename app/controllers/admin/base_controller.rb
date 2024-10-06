# frozen_string_literal: true

class Admin
  class BaseController < ApplicationController
    layout 'dashboard'

    before_action :admin_required!

    private

    def admin_required!
      redirect_to root_path, alert: 'You are not authorized to view this page' unless current_user.is_a?(Admin)
    end
  end
end
