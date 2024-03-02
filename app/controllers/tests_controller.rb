class TestsController < ApplicationController


  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found
  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def new
    @test = Test.new
  end

  def foo
    # render html: '<h2>bar</h2>'.html_safe
    # render json: { tests: Test.all }
    # bar

    results = "Inspect #{params.inspect}"
    render plain: results
    # head :no_content
  end

  def update
    @atest = Test.find(params[:id])

    if @test.update(test_params)
      redirect_to @test
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @test = Test.new(test_params)
    if @test.save
      redirect_to @test
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def test_params
    params.require(:test).permit(:title, :level)
  end

  def rescue_with_test_not_found
    render plain: "Тест не найден"
  end
end
