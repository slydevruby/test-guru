# frozen_string_literal: true

module BadgesHelper
  def random_id
    "#{(Random.rand * 100).ceil}_id"
  end

  def get_index(rule, parameter)
    if rule == 'category'
      Category.unscoped.pluck(:id).index(parameter)
    elsif rule == 'test'
      Test.unscoped.pluck(:id).index(parameter)
    else
      Test.order(:level).select(:level).distinct.all.pluck(:level).index(parameter)
    end
  end

  def insert_badge_image(url, title)
    image_tag url, alt: title, height: 100
  rescue StandardError
    image_tag 'no_image.jpg', alt: title, height: 100
  end
end
