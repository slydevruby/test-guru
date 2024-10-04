# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::BadgesController < Admin::BaseController
  before_action :set_badge, only: %i[show edit update destroy]

  def index
    @badges = Badge.all
  end

  def show; end

  def new
    @badge = Badge.new
  end

  def destroy
    @badge.destroy!
    respond_to do |format|
      format.html { redirect_to admin_badges_path, notice: 'badge was successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @badge.update(badge_params)
        format.html { redirect_to admin_badges_path(@badge), notice: 'badge was successfully updated.' }
        format.turbo_stream { render :update, locals: { badge: @badge } }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def create
    @badge = Badge.new(badge_params)
    respond_to do |format|
      if @badge.save
        format.html { redirect_to admin_badges_path(@badge), notice: 'badge was successfully created' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :url, :rule, :parameter)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end
end

# rubocop:enable Style/ClassAndModuleChildren
