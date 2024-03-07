# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :find_user, except: %i[index new create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, notice: "Пользователь #{@user.name} успешно создан"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to users_path, status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
