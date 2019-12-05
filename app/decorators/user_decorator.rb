# frozen_string_literal: true

module UserDecorator
  def complement_blank_text(attribute)
    attribute.blank? ? blank_attribute : attribute
  end

  def blank_attribute
    t("views.defaults.blank")
  end
end
