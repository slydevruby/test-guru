class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.all
    @category = Category.new
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy!
    redirect_to admin_categories_path, notice: t('.success_destroyed')
  end  

  def edit
    @category = Category.find(params[:id])
  end



  def update
    @category = Category.find(params[:id])
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_path, notice: 'category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end 

  def new 
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        # redirect_to admin_categories_path
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end  
  

 

  private
  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:title)
  end  
end
