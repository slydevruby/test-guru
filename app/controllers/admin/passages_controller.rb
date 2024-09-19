# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::PassagesController < Admin::BaseController
  skip_before_action :admin_required!

  def index
    @passages = Passage.all
  end
end

# rubocop:enable Style/ClassAndModuleChildren
