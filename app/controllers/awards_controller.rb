# frozen_string_literal: true

class AwardsController < ApplicationController
  def index
    @awards = current_user.awards
    @rules = Rule.all
  end
end
