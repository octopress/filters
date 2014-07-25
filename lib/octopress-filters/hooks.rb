require 'octopress-hooks'

module Octopress
  def self.site
    @site
  end

  def self.site=(site)
    @site = site
  end

  class SiteGrabber < Hooks::Site
    def pre_render(site)
      Octopress.site = site
    end
  end
end

