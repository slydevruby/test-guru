# frozen_string_literal: true

class PassagesController < ApplicationController
  rescue_from SocketError, with: :rescue_with_mail_failure
  before_action :set_test_passage, except: :index

  def index
    @passages = Passage.all
  end

  def show; end

  def result; end

  def update
    @passage.accept!(params[:answer_ids])

    respond_to do |format|
      if @passage.completed?
        TestsMailer.completed_test(@passage).deliver_now
        format.html { redirect_to result_passage_path(@passage) }
        format.turbo_stream { redirect_to result_passage_path(@passage) }
      else
        format.html { render :show }
      end
    end
  end

  private

  def set_test_passage
    @passage = Passage.find(params[:id])
  end

  def rescue_with_mail_failure
    redirect_to root_path, alert: t('.mail_failure') # 'Тест с таким id отсутствует'
  end
end
