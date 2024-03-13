class PassagesController < ApplicationController

  before_action :set_test_passage, only: %i[show update result]

  def show
  end

  def result
    
  end

  def update
    passage.accept!(params[:answer_ids])
    render :show
  end

  private

  def set_test_passage
    @passage = Passage.find(params[:id])
  end
end
