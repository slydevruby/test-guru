# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::CategoriesController < ApplicationController
  before_action :find_category, except: %i[index new create]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show;  end
  def edit;  end

  def create
    @category = Category.new(category_params)
    if @category.save
      # flash[:notice] = "Пользователь #{@categoryname} успешно создан"
      redirect_to admin_categories_path, notice: 'Category created'
    else
      # flash[:alert] = @category.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path, status: :see_other
    else
      flash[:alert] = @category.errors.full_messages
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy!
    redirect_to admin_categories_path, status: :see_other
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def find_category
    @category = Category.find(params[:id])
  end
end

# rubocop:enable Style/ClassAndModuleChildren
