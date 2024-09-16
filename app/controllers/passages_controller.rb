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

    if @passage.completed?

      assign_test
      TestsMailer.completed_test(@passage).deliver_now
      redirect_to result_passage_path(@passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @passage = Passage.find(params[:id])
  end

  def rescue_with_mail_failure
    redirect_to root_path, alert: t('.mail_failure') # 'Тест с таким id отсутствует'
  end

  def assign_test
    @rules = Rule.all
    @rules.each do |rule|
      if (rule.test == @passage.test) && (Passage.passed.by_test(rule.test).count == 1)
        Award.create!(user: current_user, rule:, count: 1)
      end
    end
  end
end
