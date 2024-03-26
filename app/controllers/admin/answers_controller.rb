# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::AnswersController < Admin::BaseController
  before_action :find_question, only: %i[new create]
  before_action :set_answer, only: %i[show edit update destroy]

  def show; end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_answer_path(@answer), notice: t('.success_created')
    else
      render :new
    end
  end

  # PATCH/PUT /answers/1 or /answers/1.json
  def update
    if @answer.update(answer_params)
      redirect_to admin_answer_path(@answer), notice: t('.success_updated')
    else
      render :edit
    end
  end

  # DELETE /answers/1 or /answers/1.json
  def destroy
    @answer.destroy!
    redirect_to admin_answer_path(@answer), notice: t('.success_destroyed')
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end

# rubocop:enable Style/ClassAndModuleChildren
