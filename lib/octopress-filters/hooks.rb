module Octopress
  class << self
    attr_accessor :site
  end

  class SiteGrabber < Jekyll::Generator
    def generate(site)
      Octopress.site = site
    end
  end
end
