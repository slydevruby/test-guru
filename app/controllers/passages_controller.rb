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
      give_award if @passage.grade > Passage::PASSAGE_MAX
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

  def assign_category?(badge)
    return false if badge.rule != 'category'

    category = Category.find(badge.parameter)
    Passage.by_category_title(category.title).passed.by_user(current_user).count ==
      Test.by_category(category).count
  end

  def assign_test?(badge)
    return false if badge.rule != 'test'

    (badge.parameter == @passage.test.id) &&
      (Passage.passed.by_user(current_user).by_test(badge.parameter).count == 1)
  end

  def assign_level?(badge)
    return false if badge.rule != 'level'

    Passage.by_level(badge.parameter).count.positive? &&
      (Test.by_level(badge.parameter).count ==
       Passage.by_user(current_user).by_level(badge.parameter).passed.count)
  end

  def create_award(badge)
    if Award.exists?({ badge:, user: current_user })
      Award.find_by({ badge:, user: current_user }).increment!(:count)
    else
      Award.create!(user: current_user, badge:, count: 1)
    end
  end

  def give_award
    Badge.all.each do |badge|
      create_award(badge) if assign_level?(badge)
      create_award(badge) if assign_test?(badge)
      create_award(badge) if assign_category?(badge)
    end
  end
end
