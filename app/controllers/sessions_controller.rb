# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def logout
    session[:user_id] = nil
    redirect_to login_path
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to_default_or_origin
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password '
      render :new
    end
  end

  private

  def redirect_to_default_or_origin
    if session[:return_to].present?
      redirect_to session[:return_to]
      session[:return_to] = nil
    else
      redirect_to tests_path
    end
  end
end
