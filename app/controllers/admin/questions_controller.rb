# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::QuestionsController < Admin::BaseController
  before_action :find_question, only: %i[show edit destroy update]
  before_action :find_test, only: %i[new create]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def show; end

  def new
    @question = @test.questions.new
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  def destroy
    @question.destroy!
    redirect_to admin_test_path(@question.test), notice: t('.success_destroyed')
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_question_not_found
    redirect_to root_path, alert: t('.no_such_question') # 'Вопрос с таким id отсутствует'
  end
end

# rubocop:enable Style/ClassAndModuleChildren
