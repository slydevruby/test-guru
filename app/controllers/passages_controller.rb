# frozen_string_literal: true

class PassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show; end

  def result; end

  def update
    @passage.accept!(params[:answer_ids])

    if @passage.completed?
      TestsMailer.completed_test(@passage).deliver_now
      redirect_to result_passage_path(@passage)
    else
      render :show
    end
  end

  def gist
    obj = GistQuestionService.new(@passage.current_question).call
    if obj
      flash_options = { notice: t('.success_html', url: obj.html_url) }
      current_user.gists.create!(question: @passage.current_question,
                                 gist_url: obj.html_url)
    else
      flash_options = { alert: t('.failure') }
    end

    redirect_to @passage, flash_options
  end

  private

  def set_test_passage
    @passage = Passage.find(params[:id])
  end
end
