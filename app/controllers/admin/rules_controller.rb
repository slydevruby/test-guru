# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::RulesController < Admin::BaseController
  before_action :set_rule, only: %i[show edit update destroy]
  before_action :new_rule, only: %i[new new_by_type]

  # GET /rules or /rules.json
  def index
    @rules = Rule.all
  end

  # GET /rules/1 or /rules/1.json
  def show; end

  # GET /rules/new
  def new; end

  def new_by_type
    case params['type']
    when 'cat'
      render 'new_cat'
    when 'test'
      render 'new_test'
    when 'level'
      render 'new_level'
    else
      render 'new'
    end
  end

  # GET /rules/1/edit
  def edit; end

  # POST /rules or /rules.json
  def create
    @rule = Rule.new(rule_params)

    respond_to do |format|
      if @rule.save
        format.html { redirect_to admin_rules_url, notice: 'Rule was successfully created.' }
        format.json { render :show, status: :created, location: @rule }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rules/1 or /rules/1.json
  def update
    respond_to do |format|
      if @rule.update(rule_params)
        format.html { redirect_to admin_rule_url(@rule), notice: 'Rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @rule }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rules/1 or /rules/1.json
  def destroy
    @rule.destroy!

    respond_to do |format|
      format.html { redirect_to admin_rules_url, notice: 'Rule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def new_rule
    @rule = Rule.new
    @rule.build_badge
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_rule
    @rule = Rule.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def rule_params
    params.require(:rule).permit(:title, :status, :category_id, :test_id, :level, badge_attributes: %i[id image])
  end
end

# rubocop:enable Style/ClassAndModuleChildren
