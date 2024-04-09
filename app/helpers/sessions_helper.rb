# frozen_string_literal: true

module SessionsHelper
  def flash_class(level)
    bootstrap_alert_class = {
      'success' => 'alert-success',
      'error' => 'alert-danger',
      'notice' => 'alert-info',
      'alert' => 'alert-danger',
      'warn' => 'alert-warning'
    }
    bootstrap_alert_class.default = 'alert-primary'
    bootstrap_alert_class[level]
  end

  def flash_messages
    collect = ''
    flash.each do |type, msg|
      collect += content_tag :div, msg.html_safe, class: "alert #{flash_class(type)}", role: 'alert'
    end
    render html: collect.html_safe unless collect.empty?
  end
end
