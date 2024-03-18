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
      set_session_and_redirect
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password '
      render :new
    end
  end

  private

  def set_session_and_redirect
    session[:user_id] = user.id
    redirect_to cookies.delete(:original_url) || tests_path
  end
end
