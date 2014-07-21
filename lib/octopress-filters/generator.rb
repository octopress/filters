module Octopress
  module Ink
    def self.site
      @site
    end

    def self.site=(site)
      @site = site
    end

    class SiteGrabber < Jekyll::Generator
      def generate(site)
        Octopress::Ink.site = site
      end
    end
  end
end
