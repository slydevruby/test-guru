# frozen_string_literal: true

class TestsMailer < ApplicationMailer
  def completed_test(passage)
    @user = passage.user
    @test = passage.test

    mail to: @user.email
  end

  def send_feedback(email, subject)
    mail to: email

    admin = User.find_by(type: 'Admin')
    return unless admin.present?

    send_feedback_to_admin(admin.email, email, subject).deliver_now
  end

  def send_feedback_to_admin(admin_email, from_email, subject)
    @from_email = from_email
    @subject = subject
    mail to: admin_email
  end
end
