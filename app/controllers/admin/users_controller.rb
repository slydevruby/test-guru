# frozen_string_literal: true

# rubocop:disable Style/ClassAndModuleChildren

class Admin::UsersController < Admin::BaseController
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy!
    redirect_to admin_users_path, notice: t('.user_deleted')
  rescue StandardError
    redirect_to admin_users_path, notice: t('.fail_to_delete')
  end
end

# rubocop:enable Style/ClassAndModuleChildren
