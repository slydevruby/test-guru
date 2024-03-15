# frozen_string_literal: true

class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  before_action :set_test, except: %i[index new create]

  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test, notice: "Test #{@test.title} успешно создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to tests_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def start
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.passage(@test)
  end

  private

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    redirect_to root_path, alert: 'Тест с таким id отсутствует'
  end
end
