# frozen_string_literal: true

module SessionsHelper
  def flash_messages
    if flash[:alert]
      content_tag :p, flash[:alert], class: 'flash alert'
    elsif flash[:notice]
      content_tag :p, flash[:notice], class: 'flash notice'
    end
  end
end
