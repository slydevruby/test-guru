# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::GistsController < Admin::BaseController
  skip_before_action :admin_required!

  def index
    @gists = Gist.all
  end

  def create
    passage = Passage.find(params[:id])
    gist_url, result = GistQuestionService.new(passage.current_question).call

    if result
      flash_options = { notice: t('.success_gist', url: gist_url) }
      current_user.gists.create!(question: passage.current_question,
                                 gist_url:)
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to passage, flash_options
  end
end

# rubocop:enable Style/ClassAndModuleChildren
