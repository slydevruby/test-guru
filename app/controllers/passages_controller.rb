# frozen_string_literal: true

class PassagesController < ApplicationController
  rescue_from SocketError, with: :rescue_with_mail_failure
  before_action :set_test_passage, except: :index

  def index
    @passages = Passage.all
  end

  def show; end

  def result; end

  # rubocop:disable Metrics/AbcSize
  # rubocop:disable Metrics/MethodLength
  def update
    @passage.accept!(params[:answer_ids])

    respond_to do |format|
      if @passage.completed?
        assign_award
        TestsMailer.completed_test(@passage).deliver_now
        format.html { redirect_to result_passage_path(@passage) }
        format.turbo_stream { redirect_to result_passage_path(@passage) }
      else
        format.html { render :show }
        format.turbo_stream { render :update }
      end
    end
  end
  # rubocop:enable Metrics/AbcSize
  # rubocop:enable Metrics/MethodLength

  private

  def set_test_passage
    @passage = Passage.find(params[:id])
  end

  def rescue_with_mail_failure
    redirect_to root_path, alert: t('.mail_failure') # 'Тест с таким id отсутствует'
  end

  def assign_category?(rule)
    rule.category &&
      Passage.by_category_title(rule.category.title).passed.by_user(current_user).count ==
        Test.by_category(rule.category).count
  end

  def assign_test?(rule)
    rule.test &&
      (rule.test == @passage.test) &&
      (Passage.passed.by_user(current_user).by_test(rule.test).count == 1)
  end

  def assign_level?(rule)
    (rule.level != 0) &&
      Passage.by_level(rule.level).count.positive? &&
      (Test.by_level(rule.level).count == Passage.by_level(rule.level).passed.count)
  end

  def assign_award
    @rules = Rule.all
    @rules.each do |rule|
      next unless assign_category?(rule) ||
                  assign_test?(rule) ||
                  assign_level?(rule)

      Award.create!(user: current_user, rule:, count: 1)
    end
  end
end
