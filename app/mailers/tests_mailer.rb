# frozen_string_literal: true

class TestsMailer < ApplicationMailer
  def completed_test(passage)
    @user = passage.user
    @test = passage.test

    mail to: @user.email
  end
end
