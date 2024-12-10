# frozen_string_literal: true

class BadgesController < ApplicationController
  def index
    @badges = Badge.all
    @awards = current_user.awards
  end
end
