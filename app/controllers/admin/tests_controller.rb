# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::TestsController < Admin::BaseController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  before_action :all_tests, only: %i[index update_inline]
  before_action :set_test, except: %i[index new create]

  def index; end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)
    if @test.save
      redirect_to admin_tests_path, notice: t('.success', title: @test.title)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_inline
    if @test.update(test_params)
      redirect_to admin_tests_path
    else
      render :index
    end
  end

  def destroy
    @test.destroy
    redirect_to admin_tests_path
  end

  private

  def all_tests
    @tests = Test.all
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end

  def set_test
    @test = Test.find(params[:id])
  end

  def rescue_with_test_not_found
    redirect_to root_path, alert: t('.no_such_test') # 'Тест с таким id отсутствует'
  end
end
# rubocop:enable Style/ClassAndModuleChildren
