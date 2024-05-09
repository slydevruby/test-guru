# frozen_string_literal: true

class BadgesController < ApplicationController
  before_action :find_badge, except: %i[index new create]

  def index
    @badges = Badge.all
    @new_badge = Badge.new
  end

  def show; end

  def edit; end

  def new
    @badge = Badge.new
  end

  def create
    @badge = Badge.new(badge_params)
    if @badge.save
      redirect_to badges_path, notice: t('.created')
    else
      redirect_to badges_path, alert: t('.fail_create')
    end
  end

  def update; end

  def destroy
    @badge.destroy!
    redirect_to badges_path, status: :see_other
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :url)
  end

  def find_badge
    @badge = Badge.find(params[:id])
  end
end
