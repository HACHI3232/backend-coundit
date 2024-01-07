class Article < ApplicationRecord
  belongs_to :user
  before_save :generate_slug

  private
  def generate_slug
    self.slug = title.parameterize if title.present? && slug.blank?
  end
end
