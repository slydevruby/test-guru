class QuestionsController < ApplicationController
  before_action :find_test

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    @questions = Question.all
  end

  def show
    @question = @test.questions.find(params[:id])
  end

  def new
    @test = Test.find(params[:test_id])
  end

  def destroy
    @test.questions.find(params[:id]).destroy
    redirect_to test_path(@test)
  end

  def create
    @question = @test.questions.create(question_params)

    if @question.save
      redirect_to test_path(@test)
    else
      #render :new, status: :unprocessable_entity
      render inline: "Ошибка при сохранении вопроса", layout: false, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).permit(:body, :test_id)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: "Вопрос не найден"
  end

end
