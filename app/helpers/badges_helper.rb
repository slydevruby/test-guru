# frozen_string_literal: true

module BadgesHelper
  def insert_badge_image(url, title)
    image_tag url, alt: title, height: 100
  rescue StandardError
    image_tag 'no_image.jpg', alt: title, height: 100
  end
end
