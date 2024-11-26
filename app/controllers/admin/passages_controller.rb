# frozen_string_literal: true

class Admin
  class PassagesController < Admin::BaseController
    skip_before_action :admin_required!
  end
end
