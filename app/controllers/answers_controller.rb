class AnswersController < ApplicationController
  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def destroy
    Answer.find(params[:id]).destroy
    redirect_to tests_answers_path
  end
end
