module UrlsHelper

    def print_short(url)
    link_to nil, "#{root_url}#{url.short}", target: :_blank
  end
end
