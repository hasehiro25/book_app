# frozen_string_literal: true

module UserDecorator
  def complement_blank_text(attribute)
    attribute.blank? ? blank_attribute : attribute
  end

  def blank_attribute
    t("views.defaults.blank")
  end

  def thumbnail
    avatar.variant(resize: "300x300")
  end
end
