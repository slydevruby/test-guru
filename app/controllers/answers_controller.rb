class AnswersController < ApplicationController

  before_action :find_test_question

  def index
    @answers = Answer.all
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def new
  end

  def create
    @answer = @question.answers.create(answer_params)
    
    if @answer.save
      redirect_to test_question_path(@test, @question)
    else
      #render :new, status: :unprocessable_entity
      render inline: "Ошибка при сохранении ответа", status: :unprocessable_entity
    end
  end

  def destroy
    Answer.find(params[:id]).destroy
    redirect_to tests_answers_path
  end

  private

  def answer_params
    params.require(:answer).permit(:body, :correct, :question_id)
  end

  def find_test_question
    @test  = Test.find(params[:test_id])
    @question = Question.find(params[:question_id])

  end

end
