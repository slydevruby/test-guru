# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::GistsController < Admin::BaseController
  def index
    @gists = Gist.all
  end
end

# rubocop:enable Style/ClassAndModuleChildren
