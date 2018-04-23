require 'securerandom'
require 'open-uri'

module Shortenable
  extend ActiveSupport::Concern

  def validate_url(link)
    url = URI.parse(link)
    if (url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS))
      begin
        return true if open(link).status[0] == "200"
      rescue => error
        errors.add(:base, "The url is invalid because doesn't work")
        return false
      end
    else
      errors.add(:base, "URL must start with HTTP:// or HTTPS://")
      return false
    end
  end

  def shorter
    short_url = loop do
      rand_tok = SecureRandom.urlsafe_base64(3)
      break rand_tok unless Url.where(link: short_url).exists?
    end
  end
end