# frozen_string_literal: true

class Admin
  class GistsController < Admin::BaseController
    skip_before_action :admin_required!

    def index
      @gists = Gist.all
    end
  end
end
