# frozen_string_literal: true

class GistsController < ApplicationController
  def create
    passage = Passage.find(params[:id])
    result = GistQuestionService.new(passage.current_question).call

    if result.success?
      flash_options = { notice: t('.success_gist', url: result.gist_url) }
      current_user.gists.create!(question: passage.current_question,
                                 gist_url: result.gist_url)
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to passage, flash_options
  end
end
