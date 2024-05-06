# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <sly.dev@zohomail.com>)
  layout 'mailer'
end
