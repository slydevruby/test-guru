# frozen_string_literal: true

class Feedback < ApplicationRecord
  validates :email, presence: true, format: URI::MailTo::EMAIL_REGEXP
  validates :body, presence: true
end
