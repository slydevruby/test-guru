# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new; end

  def logout
    session[:user_id] = nil
    render :new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:return_to]
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password '
      render :new
    end
  end
end
