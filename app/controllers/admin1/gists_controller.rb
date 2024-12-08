# frozen_string_literal: true

module Admin1
  class GistsController < BaseController
    skip_before_action :admin_required!

    def index
      @gists = Gist.all
    end
  end
end
