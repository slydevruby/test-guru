# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      redirect_to root_path, notice: t('feedback_saved')
    else
      redirect_to root_path, notice: t('feedback_not_saved')
    end
  end

  def new
    @feedback = Feedback.new
  end

  private

  def feedback_params
    params.require(:feedback).permit(:email, :body)
  end
end
