class CriterionsController < ApplicationController
  before_action :set_criterion, only: %i[ show edit update destroy ]

  # GET /criterions or /criterions.json
  def index
    @criterions = Criterion.all
  end

  # GET /criterions/1 or /criterions/1.json
  def show
  end

  # GET /criterions/new
  def new
    @criterion = Criterion.new
  end

  # GET /criterions/1/edit
  def edit
  end

  # POST /criterions or /criterions.json
  def create
    @criterion = Criterion.new(criterion_params)

    respond_to do |format|
      if @criterion.save
        format.html { redirect_to criterion_url(@criterion), notice: "Criterion was successfully created." }
        format.json { render :show, status: :created, location: @criterion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @criterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criterions/1 or /criterions/1.json
  def update
    respond_to do |format|
      if @criterion.update(criterion_params)
        format.html { redirect_to criterion_url(@criterion), notice: "Criterion was successfully updated." }
        format.json { render :show, status: :ok, location: @criterion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @criterion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criterions/1 or /criterions/1.json
  def destroy
    @criterion.destroy!

    respond_to do |format|
      format.html { redirect_to criterions_url, notice: "Criterion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criterion
      @criterion = Criterion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def criterion_params
      params.require(:criterion).permit(:title)
    end
end
