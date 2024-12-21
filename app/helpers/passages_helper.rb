
# frozen_string_literal: true

module PassagesHelper
  def msg_complete(tag, klass)
    content_tag :div do
      content_tag :p, class: klass  do
          t(tag, result: @passage.grade)
      end
    end
  end
end
