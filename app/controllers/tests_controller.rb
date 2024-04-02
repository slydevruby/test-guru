# frozen_string_literal: true

class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_test_not_found

  def index
    @tests = Test.all
  end

  def start
    @test = Test.find(params[:id])
    current_user.tests.push(@test)
    redirect_to current_user.passage(@test)
  end

  private

  def rescue_with_test_not_found
    redirect_to root_path, alert: t('.no_such_test') # 'Тест с таким id отсутствует'
  end
end
