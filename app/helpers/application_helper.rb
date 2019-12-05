# frozen_string_literal: true

module ApplicationHelper
  def br_with_escape(text)
    simple_format(h(text))
  end
end
