require 'octopress-hooks'

module Octopress
  module Filters

    class SiteGrabber < Hooks::Site
      def post_read(site)
        Octopress::Filters.site = site
      end
    end

    class PostHooks < Hooks::Post
      def pre_render(post)
        excerpted = post.content.match(post.site.config['excerpt_separator'])
        post.data.merge!({'excerpted' => !!excerpted})
      end
    end
  end
end
