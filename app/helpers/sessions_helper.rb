# frozen_string_literal: true

module SessionsHelper
  def flash_messages
    collect = ''
    flash.each do |type, msg|
      collect += content_tag :p, msg, class: "flash #{type}" if flash[type]
    end
    render html: collect.html_safe unless collect.empty?
  end
end
