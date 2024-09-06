class Admin::CategoriesController < ApplicationController

  include ActionView::RecordIdentifier
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def edit
    # render plain:  helpers.dom_id(@category)

    render turbo_stream: turbo_stream.replace(dom_id(@category),
                                              partial: "form", locals: { category: @category })

  end

  def destroy
    @category.destroy!
    respond_to do |format|
      format.html { redirect_to admin_categories_path, notice: t('.success_destroyed') }
      format.turbo_stream { render :destroy, locals: { category: @category } }
      format.json { head :no_content }
    end
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_path(@category), notice: 'Category was successfully created' }
        format.turbo_stream { render :create }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.turbo_stream { render :new, locals: { category: @category} }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_category_path(@category), notice: "Post was successfully updated." }
        format.turbo_stream { render :update, locals: { category: @category } }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
  # Only allow a list of trusted parameters through.

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
