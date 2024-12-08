# frozen_string_literal: true

module Admin1
  class BadgesController < BaseController
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
      redirect_to admin_badges_path, notice: 'badge was successfully destroyed.'
    end

    def update
      if @badge.update(badge_params)
        redirect_to admin_badges_path, notice: 'badge was successfully updated.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def create
      @badge = Badge.new(badge_params)
      if @badge.save
        redirect_to admin_badges_path, notice: 'badge was successfully created'
      else
        render :new, status: :unprocessable_entity
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
end
