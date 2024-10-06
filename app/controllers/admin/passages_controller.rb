# frozen_string_literal: true

class Admin
  class PassagesController < Admin::BaseController
    skip_before_action :admin_required!

    def index
      @passages = Passage.all
    end

    def destroy
      Passage.find(params[:id]).destroy!
      redirect_to admin_passages_path, notice: t('.success_destroyed')
    end
  end
end
