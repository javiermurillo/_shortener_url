class Url < ApplicationRecord
  include Shortenable
  validates :link, presence: true
  validate :is_url
  before_create :shortenize_link

  def is_url
    validate_url(link)
  end

  def to_s
    link
  end

  def shortenize_link
    self.short = shorter
  end

end
