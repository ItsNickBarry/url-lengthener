class Link < ApplicationRecord
  before_validation :ensure_slug
  validates :url, :slug, presence: true, uniqueness: true
  validates_format_of :url, with: URI::regexp(%w(http https))

  private

    def ensure_slug
      self.slug ||= SecureRandom::alphanumeric 2000
    end
end
