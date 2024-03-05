class AnswersController < ApplicationController
  before_action :find_question, only: %i[index new create]
  before_action :find_answer, only: %i[show destroy]

  def index
    @answers = @question.answers
  end

  def show; end

  def new
    @answer = @question.answers.new
  end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to edit_question_path(@question)
    else
      render inline: @answer.errors.full_messages
    end
  end

  def destroy
    @answer.destroy
    redirect_to edit_question_path(@answer.question)
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
