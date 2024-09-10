# frozen_string_literal: true

class AwardsController < ApplicationController
  def index
    @awards = Award.where(user: current_user)
    @rules = Rule.all
  end
end
