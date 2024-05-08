# frozen_string_literal: true

class FeedbacksController < ApplicationController
  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      TestsMailer.send_feedback(@feedback.email, @feedback.body).deliver_now
      redirect_to root_path, notice: t('feedback_saved')
    else
      render :new
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
